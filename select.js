const { Client } = require('pg')
const client     = new Client({database:"test", user:"aaaa", password:'aaaa', host: 'localhost'})
client.connect()

client.query
 ('SELECT $1::text as message', ['Hello world!'],
  function(err, res)
   {console.log(err ? err.stack : res.rows[0].message) // Hello World!
    client.end()
   }
 )
