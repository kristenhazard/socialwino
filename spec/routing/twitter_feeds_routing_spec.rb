require "spec_helper"

describe TwitterFeedsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/twitter_feeds" }.should route_to(:controller => "twitter_feeds", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/twitter_feeds/new" }.should route_to(:controller => "twitter_feeds", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/twitter_feeds/1" }.should route_to(:controller => "twitter_feeds", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/twitter_feeds/1/edit" }.should route_to(:controller => "twitter_feeds", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/twitter_feeds" }.should route_to(:controller => "twitter_feeds", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/twitter_feeds/1" }.should route_to(:controller => "twitter_feeds", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/twitter_feeds/1" }.should route_to(:controller => "twitter_feeds", :action => "destroy", :id => "1")
    end

  end
end
