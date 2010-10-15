class TwitterFeed < ActiveRecord::Base
  belongs_to :winery
  
  def client
    @client ||= begin
      oauth.authorize_from_access(auth_token, auth_secret)
      Twitter::Base.new(oauth)
    end
  end
  
  # i want to put this only twitter_feed.rb but don't know how to share it
  def oauth
    @oauth ||= Twitter::OAuth.new(APP_CONFIG[:twitter][:consumer_key], APP_CONFIG[:twitter][:consumer_secret])
  end  
end
