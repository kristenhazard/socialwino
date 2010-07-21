require 'spec_helper'
#require File.dirname(__FILE__) + '/../spec_helper'

describe PrelaunchSignupsController do

  def mock_prelaunch_signup(stubs={})
    @mock_prelaunch_signup ||= mock_model(PrelaunchSignup, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all prelaunch_signups as @prelaunch_signups" do
      PrelaunchSignup.stub(:all) { [mock_prelaunch_signup] }
      get :index
      assigns(:prelaunch_signups).should eq([mock_prelaunch_signup])
    end
  end

  describe "GET show" do
    it "assigns the requested prelaunch_signup as @prelaunch_signup" do
      PrelaunchSignup.stub(:find).with("37") { mock_prelaunch_signup }
      get :show, :id => "37"
      assigns(:prelaunch_signup).should be(mock_prelaunch_signup)
    end
  end

  describe "GET new" do
    it "assigns a new prelaunch_signup as @prelaunch_signup" do
      PrelaunchSignup.stub(:new) { mock_prelaunch_signup }
      get :new
      assigns(:prelaunch_signup).should be(mock_prelaunch_signup)
    end
  end

  describe "GET edit" do
    it "assigns the requested prelaunch_signup as @prelaunch_signup" do
      PrelaunchSignup.stub(:find).with("37") { mock_prelaunch_signup }
      get :edit, :id => "37"
      assigns(:prelaunch_signup).should be(mock_prelaunch_signup)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created prelaunch_signup as @prelaunch_signup" do
        PrelaunchSignup.stub(:new).with({'these' => 'params'}) { mock_prelaunch_signup(:save => true) }
        post :create, :prelaunch_signup => {'these' => 'params'}
        assigns(:prelaunch_signup).should be(mock_prelaunch_signup)
      end

      it "redirects to the created prelaunch_signup" do
        PrelaunchSignup.stub(:new) { mock_prelaunch_signup(:save => true) }
        post :create, :prelaunch_signup => {}
        response.should redirect_to(prelaunch_signup_url(mock_prelaunch_signup))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved prelaunch_signup as @prelaunch_signup" do
        PrelaunchSignup.stub(:new).with({'these' => 'params'}) { mock_prelaunch_signup(:save => false) }
        post :create, :prelaunch_signup => {'these' => 'params'}
        assigns(:prelaunch_signup).should be(mock_prelaunch_signup)
      end

      it "re-renders the 'new' template" do
        PrelaunchSignup.stub(:new) { mock_prelaunch_signup(:save => false) }
        post :create, :prelaunch_signup => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested prelaunch_signup" do
        PrelaunchSignup.should_receive(:find).with("37") { mock_prelaunch_signup }
        mock_prelaunch_signup.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :prelaunch_signup => {'these' => 'params'}
      end

      it "assigns the requested prelaunch_signup as @prelaunch_signup" do
        PrelaunchSignup.stub(:find) { mock_prelaunch_signup(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:prelaunch_signup).should be(mock_prelaunch_signup)
      end

      it "redirects to the prelaunch_signup" do
        PrelaunchSignup.stub(:find) { mock_prelaunch_signup(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(prelaunch_signup_url(mock_prelaunch_signup))
      end
    end

    describe "with invalid params" do
      it "assigns the prelaunch_signup as @prelaunch_signup" do
        PrelaunchSignup.stub(:find) { mock_prelaunch_signup(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:prelaunch_signup).should be(mock_prelaunch_signup)
      end

      it "re-renders the 'edit' template" do
        PrelaunchSignup.stub(:find) { mock_prelaunch_signup(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested prelaunch_signup" do
      PrelaunchSignup.should_receive(:find).with("37") { mock_prelaunch_signup }
      mock_prelaunch_signup.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the prelaunch_signups list" do
      PrelaunchSignup.stub(:find) { mock_prelaunch_signup }
      delete :destroy, :id => "1"
      response.should redirect_to(prelaunch_signups_url)
    end
  end

end
