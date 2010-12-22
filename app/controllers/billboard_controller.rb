class BillboardController < ApplicationController
  
  layout "billboard"
  
  def index
    @twitter_feed = TwitterFeed.first
    client = @twitter_feed.client
    @tweets = client.home_timeline
    @last_tweet_id = @tweets.first.id
        
    respond_to do |format|
      format.html
      format.json { render :layout => false ,
                           :json => @tweets.to_json }
    end
  end
  
  
  def update_tweets
    last_tweet_id = params[:id]
    @twitter_feed = TwitterFeed.first
    client = @twitter_feed.client
    @tweets = client.home_timeline(:since_id => last_tweet_id)
    @last_tweet_id = @tweets.first.id unless @tweets.empty?
        respond_to do |format|
      format.html { render :action => 'index' }
      format.json { render :layout => false ,
                           :json => @tweets.to_json }
    end
  end
  
  def initialize_tweets
    @twitter_feed = TwitterFeed.first
    client = @twitter_feed.client
    @tweets = client.home_timeline(:count => 30)
    @last_tweet_id = @tweets.first.id
    
    respond_to do |format|
      format.html
      format.json { render :layout => false ,
                           :json => @tweets.to_json }
    end
  end
  
  # this demo will be outside of authentication, no need to login for it
  def show_demo
    @twitter_feed = TwitterFeed.first
    client = @twitter_feed.client
    @tweets = client.home_timeline
    respond_to do |format|
      format.html
      format.json { render :layout => false ,
                           :json => @tweets.to_json }
    end
  end
end
