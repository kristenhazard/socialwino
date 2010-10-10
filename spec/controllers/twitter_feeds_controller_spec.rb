require 'spec_helper'

describe TwitterFeedsController do

  def mock_twitter_feed(stubs={})
    @mock_twitter_feed ||= mock_model(TwitterFeed, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all twitter_feeds as @twitter_feeds" do
      TwitterFeed.stub(:all) { [mock_twitter_feed] }
      get :index
      assigns(:twitter_feeds).should eq([mock_twitter_feed])
    end
  end

  describe "GET show" do
    it "assigns the requested twitter_feed as @twitter_feed" do
      TwitterFeed.stub(:find).with("37") { mock_twitter_feed }
      get :show, :id => "37"
      assigns(:twitter_feed).should be(mock_twitter_feed)
    end
  end

  describe "GET new" do
    it "assigns a new twitter_feed as @twitter_feed" do
      TwitterFeed.stub(:new) { mock_twitter_feed }
      get :new
      assigns(:twitter_feed).should be(mock_twitter_feed)
    end
  end

  describe "GET edit" do
    it "assigns the requested twitter_feed as @twitter_feed" do
      TwitterFeed.stub(:find).with("37") { mock_twitter_feed }
      get :edit, :id => "37"
      assigns(:twitter_feed).should be(mock_twitter_feed)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created twitter_feed as @twitter_feed" do
        TwitterFeed.stub(:new).with({'these' => 'params'}) { mock_twitter_feed(:save => true) }
        post :create, :twitter_feed => {'these' => 'params'}
        assigns(:twitter_feed).should be(mock_twitter_feed)
      end

      it "redirects to the created twitter_feed" do
        TwitterFeed.stub(:new) { mock_twitter_feed(:save => true) }
        post :create, :twitter_feed => {}
        response.should redirect_to(twitter_feed_url(mock_twitter_feed))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved twitter_feed as @twitter_feed" do
        TwitterFeed.stub(:new).with({'these' => 'params'}) { mock_twitter_feed(:save => false) }
        post :create, :twitter_feed => {'these' => 'params'}
        assigns(:twitter_feed).should be(mock_twitter_feed)
      end

      it "re-renders the 'new' template" do
        TwitterFeed.stub(:new) { mock_twitter_feed(:save => false) }
        post :create, :twitter_feed => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested twitter_feed" do
        TwitterFeed.should_receive(:find).with("37") { mock_twitter_feed }
        mock_twitter_feed.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :twitter_feed => {'these' => 'params'}
      end

      it "assigns the requested twitter_feed as @twitter_feed" do
        TwitterFeed.stub(:find) { mock_twitter_feed(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:twitter_feed).should be(mock_twitter_feed)
      end

      it "redirects to the twitter_feed" do
        TwitterFeed.stub(:find) { mock_twitter_feed(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(twitter_feed_url(mock_twitter_feed))
      end
    end

    describe "with invalid params" do
      it "assigns the twitter_feed as @twitter_feed" do
        TwitterFeed.stub(:find) { mock_twitter_feed(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:twitter_feed).should be(mock_twitter_feed)
      end

      it "re-renders the 'edit' template" do
        TwitterFeed.stub(:find) { mock_twitter_feed(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested twitter_feed" do
      TwitterFeed.should_receive(:find).with("37") { mock_twitter_feed }
      mock_twitter_feed.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the twitter_feeds list" do
      TwitterFeed.stub(:find) { mock_twitter_feed }
      delete :destroy, :id => "1"
      response.should redirect_to(twitter_feeds_url)
    end
  end

end
