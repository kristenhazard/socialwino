class TwitterController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:new, :create]
  
  def index
  end

  def authorize
    oauth.set_callback_url("http://#{request.host}#{":#{request.port}" unless request.port == 80}/twitter/finalize")
    session[:request_token] = oauth.request_token.token
    session[:request_secret] = oauth.request_token.secret
    
    redirect_url = oauth.request_token.authorize_url
    redirect_url = "http://" + redirect_url unless redirect_url.match(/^http:\/\//)
    redirect_to redirect_url
  end

  def finalize
    oauth.authorize_from_request(session[:request_token], session[:request_secret], params[:oauth_verifier])
    
    @profile = Twitter::Base.new(oauth).verify_credentials
    
    logger.debug @profile.screen_name
    
    session[:request_token]
    session[:request_secret]
    
    session[:auth_token] = oauth.access_token.token
    session[:auth_secret] = oauth.access_token.secret
    
    # twitter_feed = TwitterFeed.find_by_screen_name(@profile.screen_name)
    twitter_feed = TwitterFeed.find(:first, :conditions => [ "lower(screen_name) = ?", @profile.screen_name.downcase ])
    
    twitter_feed.update_attributes({
      :auth_token => oauth.access_token.token, 
      :auth_secret => oauth.access_token.secret,
    })
    
    redirect_to(wineries_url)
    
  end
  
end
