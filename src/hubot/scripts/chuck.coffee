# Chuck Norris Jokes
#
# chuck me - returns random Chuck Norris joke

module.exports = (robot) ->
  robot.respond /(chuck)( me)?(.*)/i, (msg) ->
    query = msg.match[3]
    msg.http("http://api.icndb.com/jokes/random")
      .query({
        json: true
      })
      .get() (err, res, body) ->
        data = JSON.parse(body)
        if data.type == "success"
          msg.send data.value.joke