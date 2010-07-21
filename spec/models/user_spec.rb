require 'spec_helper'

module UserSpecHelper
  def valid_user_attributes
    {
      :name => "Kristen Hazard",
      :email => "kristen@hazardbio.com",
      :username => "kristenhazard"
    }
  end
end

describe User do
  it "is valid with valid attributes"
  
  it "is not valid without an email"
  
  it "is not valid without a username"
  
  it "is not valid without a name"
  
  it "is not valid if username is already in database"
  
  it "is not valid if email is already in database"
  
end
