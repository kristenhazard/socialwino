class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  helper_method :oauth
  
  def after_sign_in_path_for(resource)
      wineries_path
  end
  
  private
  
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

end
