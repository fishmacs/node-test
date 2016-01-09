router = require('koa-router')()
Readable = require('stream').Readable

getCount = ->
  yield 1
  return 2

counter = getCount()
  
router.get '/', ->
  counter = getCount()
  yield @render 'home.html', finished: false

router.get '/sse', ->
  stream = new Readable
  stream._read = ->
    ret = counter.next()
    if ret.done
      # can't use setTimeout(stack overflow)
      #setTimeout (-> stream.push 'yes'; stream.push null), 5000
      stream.push 'yes'
      stream.push null
      stream.push null
    else
      setTimeout (-> stream.push 'no'), 5000
  @sse stream

module.exports = router.routes.bind router
