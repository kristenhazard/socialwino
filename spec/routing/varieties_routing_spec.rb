require "spec_helper"

describe VarietiesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/varieties" }.should route_to(:controller => "varieties", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/varieties/new" }.should route_to(:controller => "varieties", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/varieties/1" }.should route_to(:controller => "varieties", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/varieties/1/edit" }.should route_to(:controller => "varieties", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/varieties" }.should route_to(:controller => "varieties", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/varieties/1" }.should route_to(:controller => "varieties", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/varieties/1" }.should route_to(:controller => "varieties", :action => "destroy", :id => "1")
    end

  end
end
