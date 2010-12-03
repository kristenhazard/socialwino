$(function () {
  var fetchTweetsEvery = 5 ;  // minutes
  var scrollEvery = 10 ;      // seconds
  var pourTimer, scrollTimer;
  var pourEvery = 4;         // seconds
  var scrollLeft = 0;
  const TWEET_WIDTH = 200;
  var tweets ;
  var paused = false;
  console.log ("DOM Ready");
  
  // Gather Sample Tweet Set
  getTweets ();
  scrollTweets ();
  setupWineMenu ();
  pourTweet();
  
  function getTweets () {
    var $divs
    // tweets = new Tweets (sample, ...)
    tweets = new Tweets (0, function (status) {
      console.log ("Callback Executed, build visual tweet stream - status: " + status)
      $divs = tweets.oldestNTweets(10, "div");
      $.each ($divs, function () {
        $("#tweet-scroller > div").append($(this))
      })
    }); 
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
      $('#new-tweet').replaceWith(tweets.nextLatest("div").attr('id', 'new-tweet'));
      $('#new-tweet').addClass('tweet-pour'); //TODO doesn't seem to do anything
      $('#new-tweet').bind ('webkitAnimationEnd', function (e) {
        // Set Tweets New Position in Class
        console.log("Animation Pour End")
        //$("#new-tweet").addClass('in-glass').toggleClass("tweet-pour")
        $("#new-tweet").css({left: 646, top:462}).toggleClass("tweet-pour")
      })
      // Fade in Tweet After Pour
      setTimeout (function () {
        /*
        $('#new-tweet').fadeIn (2000).delay(4500).animate({left: 900, top: 0}, 2000, 'swing').fadeOut(500).css({left: 645, top: 460});
      }, 1500);
        */
        $('#new-tweet').addClass("fly-away"); // USE CSS ANIMATION
      },7500);
      // Rotate Bottle Back to Horizontal
      setTimeout (function () {
        $("#bottle").toggleClass('pour');
      },3000);
    }, pourEvery * 3000)
  }         
  
  function setupWineMenu () {
    $(".wine-menu h4").click (function (e) {
      var classes;
      $('.wine-menu').toggleClass ("show-menu");
      classes = $('.wine-menu').attr('class')
      console.log ("Touched 'Now Pouring' " + classes);
      
    });
    
    $(".wine").click (function (e) {
      var classes;
      $(this).toggleClass ('show-info');
      classes = $(this).attr('class');
      console.log ("Touched Wine Bottle");
     
    })
  }    

         
});
