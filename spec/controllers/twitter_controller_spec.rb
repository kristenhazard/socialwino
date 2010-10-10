require 'spec_helper'

describe TwitterController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'login'" do
    it "should be successful" do
      get 'login'
      response.should be_success
    end
  end

  describe "GET 'finalize'" do
    it "should be successful" do
      get 'finalize'
      response.should be_success
    end
  end

end
