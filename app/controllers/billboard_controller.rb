class BillboardController < ApplicationController
  layout "billboard"
  
  def index
    
    @twitter_feed = TwitterFeed.first
    client = @twitter_feed.client
    @tweets = client.home_timeline
    
    respond_to do |format|
      format.html
      format.json { render :layout => false ,
                           :json => @tweets.to_json }
    end
    
  end
  
  def update_tweets
    
  end
  
  def initialize_tweets
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
