# TwitteRSS

A server which retrieves [Twitter](https://twitter.com/) feeds and returns them in [RSS](http://cyber.law.harvard.edu/rss/rss.html) format. Inspired by [Dave Winer's](http://scripting.com/) [tweetsToRss](http://scripting.com/2015/01/12/goodRssFromTwitter.html) project.

## Endpoints

### User Tweets

    http://[yourserver]/user/[TwitterScreenName]

### Tweets by Search Term

    http://[yourserver]/search/[SearchTerm]

## Installation

    git clone https://github.com/brentrockwood/TwitteRSS
    npm install
    npm start

## Deployment

This app is Foreman compliant and does not require filesystem access.  Therefore, it is able to run on PAAS providers like [Heroku](https://heroku.com/) just fine.

