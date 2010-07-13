require "spec_helper"

describe PrelaunchSignupsController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/prelaunch_signups" }.should route_to(:controller => "prelaunch_signups", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/prelaunch_signups/new" }.should route_to(:controller => "prelaunch_signups", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/prelaunch_signups/1" }.should route_to(:controller => "prelaunch_signups", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/prelaunch_signups/1/edit" }.should route_to(:controller => "prelaunch_signups", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/prelaunch_signups" }.should route_to(:controller => "prelaunch_signups", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/prelaunch_signups/1" }.should route_to(:controller => "prelaunch_signups", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/prelaunch_signups/1" }.should route_to(:controller => "prelaunch_signups", :action => "destroy", :id => "1") 
    end

  end
end
