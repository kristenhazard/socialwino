$(function () {
  var fetchTweetsEvery = 5 ;  // minutes
  var scrollEvery = 10 ;      // seconds
  var pourTimer, scrollTimer;
  var pourEvery = 4;         // seconds
  var scrollLeft = 0;
  const TWEET_WIDTH = 200;
  var tweets ;
  console.log ("DOM Ready");
  
  // Gather Sample Tweet Set
  getTweets ();
  scrollTweets ();
  pourTweet();
  
  function getTweets () {
    var $divs
    tweets = new Tweets (sample);
      $divs = tweets.oldest(10, "div");
      $.each ($divs, function () {
        $("#tweet-scroller > div").append($(this))
      })
  };
  
  function scrollTweets () {
    var $div = $("#tweet-scroller > div");
    // Slide Left
    setInterval (function () {
      console.log ("scroller tweets")
      $div.animate ({left: -TWEET_WIDTH - 12}, 2200, "swing", function () {
        // Clone Left Elemnt and Add it to the End
        console.log ("remove now")
        $clone = $("div:first", $div).remove();
        $div.css('left', 0);
        $div.append($clone);

        
        });
    }, scrollEvery * 1000);
  };
  
  function pourTweet ( ) {
    pourTimer = setInterval (function () {
      console.log ("pour wine");
      // Add Class to Rotate Wine Bottle           
      $("#bottle").toggleClass('pour');
      $('#new-tweet').replaceWith(tweets.latest("div").attr('id', 'new-tweet'));
      $('#new-tweet').addClass('pourmove');
      // Fade in Tweet After Pour
      setTimeout (function () {
        $('#new-tweet').fadeIn (2000).delay(4500).animate({left: 900, top: 0}, 2000, 'swing').fadeOut(500).css({left: 645, top: 460});
      }, 1500);
      
      // Rotate Bottle Back to Horizontal
      setTimeout (function () {
        $("#bottle").toggleClass('pour');
      },3000);
    }, pourEvery * 3000)
  }         
  
       

         
});
