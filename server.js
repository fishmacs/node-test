require('coffee-script/register');

var koa = require('koa');
var koaConf = require('./config/koa');
var routes = require('./src/routes');

var app = module.exports = koa();
koaConf(app);
app.use(routes());

if (!module.parent) {
  app.listen(3300);
}
