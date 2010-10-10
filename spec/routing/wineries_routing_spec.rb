require "spec_helper"

describe WineriesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/wineries" }.should route_to(:controller => "wineries", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/wineries/new" }.should route_to(:controller => "wineries", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/wineries/1" }.should route_to(:controller => "wineries", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/wineries/1/edit" }.should route_to(:controller => "wineries", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/wineries" }.should route_to(:controller => "wineries", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/wineries/1" }.should route_to(:controller => "wineries", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/wineries/1" }.should route_to(:controller => "wineries", :action => "destroy", :id => "1")
    end

  end
end
