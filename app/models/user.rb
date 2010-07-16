class User < ActiveRecord::Base
  acts_as_authentic
  
  def self.find_by_username_or_email(login)
    User.find_by_username(login) || User.find_by_email(login)
  end
end
