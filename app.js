var express = require('express');
var app = express();

var Controller = require('./controller');
app.use('/greekApi', Controller);

module.exports = app;
