var mysqlApp = require('mysql');
var connection = mysqlApp.createConnection({
  host : 'xxx',
  user: 'xxx',
  password: 'xxx',
  database: 'greekMythology'
});


connection.connect();

module.exports = connection;
