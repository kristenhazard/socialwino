#require 'spec_helper'
require File.dirname(__FILE__) + '/../spec_helper'

describe PrelaunchSignup do
  before(:each) do
    @prelaunchsignup = PrelaunchSignup.new
  end
  
  it "should be valid" do
    @prelaunchsignup.email = "kristen@hazardbio.com"
    @prelaunchsignup.should be_valid
  end
  
  it "should fail without email" do
    @prelaunchsignup.should_not be_valid
    @prelaunchsignup.should have(1).error_on(:email)
  end
  
  
end
