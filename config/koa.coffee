bodyParser = require 'koa-bodyparser'
views = require 'koa-views'
koaStatic = require 'koa-static'
logger = require 'koa-logger'
sse = require 'koa-sse'

module.exports = (app) ->
  app.use logger()
  app.use koaStatic 'public'
  app.use bodyParser()
  app.use views '../src/views', map: html: 'ect'
  app.use sse()
