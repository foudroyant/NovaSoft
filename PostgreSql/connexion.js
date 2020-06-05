const { Client } = require('pg')

const client = new Client({
    user: 'stephane',
    host: 'localhost',
    database: 'novasoft',
    password: 'stephane',
    port: 5432,
  })
client.connect()

module.exports=client;