var Tweets = Class.extend ({
  init: function (data) {
    if (typeof data == "String") {
      this.tweets = $.parseJSON (data)
    } else {
      this.tweets = data;
    }
    this.newestTweetNr = 0;
  },
  
  oldest: function (nr, wrapper) {
    var $box, getNr, i, lastNr, tweet;
    var boxes = [ ];
    lastNr = Math.max (0, this.number() - nr);
    // Oldest at bottom of list
    for (i = this.tweets.length -1 ; i > lastNr; i--) {
      tweet = this.tweets[i];
      boxes.push(this.buildTweet (tweet, wrapper));
    }
    return boxes;
  },
  
  latest: function (wrapper) {
    var newTweet = this.tweets[this.newestTweetNr]
    this.newestTweetNr += 1;
    if (this.newestTweetNr > 10) {
      //Need to go after a new set of tweets
      this.newestTweetNr = 0;
    }
    return this.buildTweet (newTweet, wrapper) 
  },
  
  buildTweet: function (tweet, wrapper) {
    var $box;
    $box = $("<" + wrapper + ">").addClass("tweet");
    $box.append ($('<img src="' + tweet.user.profile_image_url + '" />'));
    $box.append ($('<p>' + tweet.text + '</p>'));
    return $box
  },
  
  number: function () {
    return this.tweets.length;
  }
});

$(function () {
  
})

