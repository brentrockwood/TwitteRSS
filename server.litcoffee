# Main Entry Point

We are using the [Express](http://expressjs.com) web framework for our server.

    express = require 'express'
    app = express()

Desmond Morris's [twitter](https://www.npmjs.com/package/twitter) library is the shizzle for talking to the Twitter API.  Don't forget to set your Twitter consumer key environment variables!

    twitter = require 'twitter'

    twitter = new twitter
      consumer_key: process.env.TWITTER_CONSUMER_KEY
      consumer_secret: process.env.TWITTER_CONSUMER_SECRET

We are using [Jade](http://jade-lang.com) to render the RSS.

    app.set 'view engine', 'jade'

## Routes

The first route gets the most recent tweets for a particular user.

    app.get '/user/:user', (req, res) ->
      opts =
        screen_name: req.params.user

      twitter.get '/statuses/user_timeline', opts, (err, body) ->
        if err
          return res.send 500, err

        res.render 'rss', { statuses: body }

The second route gets the most recent tweets based on a search term.

    app.get '/search/:term', (req, res) ->
      opts =
        q: req.params.term

      twitter.get '/search/tweets', opts, (err, body) ->
        if err
          return res.send 500, err

        res.render 'rss', body

## Startup

In dev, we listen on port 5000.  The port environment variable is set on common deployment sites like [Heroku](http://heroku.com/).

    port = process.env.PORT || 5000
    app.listen port
    console.log 'Server is listening on port ' + port

