var Tweets = Class.extend ({
  
  
  init: function (data, callback) {
    this.nr = 0; // tracks the number of tweets collected from server
    this.tweets = [ ];
    if (data == 0) {
      this.fetchMoreTweets (callback); // Get intial set of tweets
    } else {
      if (typeof data == "String") {
        this.tweets = $.parseJSON (data)
      } else {
        this.tweets = data;
      }
      this.nr = this.number();
      this.nextTweetNr = 0;
      callback ('OK'); // data is available
    }
  },
  
  oldestNTweets: function (nr, wrapper) {
    var $box, getNr, i, lastNr, tweet;
    var boxes = [ ];
    lastNr = Math.max (0, this.number() - nr);
    // Oldest at bottom of list
    for (i = this.tweets.length -1 ; i > lastNr; i--) {
      tweet = this.tweets[i];
      boxes.push(this.buildTweet (tweet, wrapper, i));
    }
    this.nextTweetNr = lastNr;
    return boxes;
  },
  
  nextLatest: function (wrapper) {
    var newTweet = this.tweets[this.nextTweetNr]
    this.nextTweetNr -= 1; 
    this.tweets.pop();     // Remove from end
    if (this.nextTweetNr < 4) {
      //Need to go after a new set of tweets
      this.nextTweetNr = 0;
      //fetchMoreTweets (); // JSON request
    }
    return this.buildTweet (newTweet, wrapper, this.nextTweetNr) 
  },
  
  addNewRemoveOldest: function () {
   
  },
  
  fetchMoreTweets: function (callback) {
    var that = this;
    $.getJSON("/billboard/initialize_tweets.json", function(data, status) {
        console.log ("JSON fetched from server, status: " + status + " nr = " + data.length);

        that.tweets = data.concat(that.tweets);
        callback(status)
    })
  },
  
  buildTweet: function (tweet, wrapper, nr) {
    var time, $box;
    $box = $("<" + wrapper + ">").addClass("tweet");
    $box.append ($('<img src="' + tweet.user.profile_image_url + '" />'));
    //Fri Oct 29 16:40:25 +0000 2010
    time = tweet.created_at.split(" ");
    time = time[0] + " " + time[1] + " " + time[2] + " " + time[3];
    $box.append ($('<p>' + tweet.text + '</p>'));
    $box.append ($('<p class="time">' + time + '</p>'));
    $box.append ($('<p class="nr">' + nr + '</p>')); // add tweet number
    return $box
  },
  
  number: function () {
    return this.tweets.length;
  }
});

$(function () {
  
})

