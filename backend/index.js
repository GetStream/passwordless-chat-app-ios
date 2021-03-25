const express = require('express')
const jwt = require('jsonwebtoken')
const StreamChat = require('stream-chat').StreamChat
const fs = require('fs')

const app = express()
const port = 3000

const auth0Public = fs.readFileSync('public.pem');  // get public key
const client = new StreamChat('p3peksa7mzmx', 'cfc65rbjjg45d5p7afntsde9u3pku3yr6wbkp9dq8qa5bwbpkpakema4cuuu226a')

app.get('/', (req, res) => {
  const auth0Token = req.query.auth0Token
  try {
    var decoded = jwt.verify(auth0Token, auth0Public)
    const token = client.createToken(decoded.nickname)

    const channel = client.channel('messaging', 'general', { name: 'General' })
    channel.create().finally(() => { 
      channel.addMembers([decoded.nickname])
    })

    res.send(token)
  } catch(err) {
    res.status(401).send('Unauthorized')
    console.log(err)
  }
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})
