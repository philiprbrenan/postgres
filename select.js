const { Client } = require('pg')
const client     = new Client({database:"test", user:'aaaa', password:'aaaa', host:'localhost'})
client.connect()

client.query
 ('SELECT * from test',
  function(err, res)
   {console.log(err ? err.stack : res)
    client.end()
   }
 )

