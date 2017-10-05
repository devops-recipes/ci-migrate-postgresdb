var knex = require('knex');

var db = require('knex')({
  client: 'pg',
  connection: {
    host : '127.0.0.1',
    user : 'postgres',
    password : '',
    database : 'test'
  }
});

module.exports.db = db;
