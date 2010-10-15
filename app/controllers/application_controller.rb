class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  helper_method :current_user, :logged_in?, :oauth
  
  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  # i want to put this in twitter_feed.rb but don't know how to share it
  def oauth
    @oauth ||= Twitter::OAuth.new(APP_CONFIG[:twitter][:consumer_key], APP_CONFIG[:twitter][:consumer_secret])
  end  
  
  protected
  
  def admin?
    if current_user
     current_user.admin == true
   end
  end
  
  def require_admin
    unless admin?
      flash[:error] = "You definitely can't access that page"
      redirect_to home_path
      false
    end
  end
  
  def logged_in?
    if current_user
      current_user
    end
  end
  
  def require_logged_in
    unless logged_in?
      flash[:error] = "You need to be logged in to access that page"
      redirect_to :login
      false
    end
  end
  

end
