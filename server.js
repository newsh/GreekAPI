
/*When run as cronjob on boot, better wait some time until mySQL db is done initializing*/
setTimeout(startServer, 10000);


function startServer() {

  var app = require('./app');
  var https = require('https');
  var fs = require('fs');
  var port = process.env.PORT || 443;

  var sslOptions = {
    key: fs.readFileSync('/path/to/key'),
    cert: fs.readFileSync('/path/to/cert')
  };


  https.createServer(sslOptions, app).listen(port,function() {
    console.log('Express server listerning on port ' + port);
  })

}
