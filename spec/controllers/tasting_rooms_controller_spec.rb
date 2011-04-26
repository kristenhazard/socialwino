require 'spec_helper'

describe TastingRoomsController do

  def mock_tasting_room(stubs={})
    (@mock_tasting_room ||= mock_model(TastingRoom).as_null_object).tap do |tasting_room|
      tasting_room.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all tasting_rooms as @tasting_rooms" do
      TastingRoom.stub(:all) { [mock_tasting_room] }
      get :index
      assigns(:tasting_rooms).should eq([mock_tasting_room])
    end
  end

  describe "GET show" do
    it "assigns the requested tasting_room as @tasting_room" do
      TastingRoom.stub(:find).with("37") { mock_tasting_room }
      get :show, :id => "37"
      assigns(:tasting_room).should be(mock_tasting_room)
    end
  end

  describe "GET new" do
    it "assigns a new tasting_room as @tasting_room" do
      TastingRoom.stub(:new) { mock_tasting_room }
      get :new
      assigns(:tasting_room).should be(mock_tasting_room)
    end
  end

  describe "GET edit" do
    it "assigns the requested tasting_room as @tasting_room" do
      TastingRoom.stub(:find).with("37") { mock_tasting_room }
      get :edit, :id => "37"
      assigns(:tasting_room).should be(mock_tasting_room)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created tasting_room as @tasting_room" do
        TastingRoom.stub(:new).with({'these' => 'params'}) { mock_tasting_room(:save => true) }
        post :create, :tasting_room => {'these' => 'params'}
        assigns(:tasting_room).should be(mock_tasting_room)
      end

      it "redirects to the created tasting_room" do
        TastingRoom.stub(:new) { mock_tasting_room(:save => true) }
        post :create, :tasting_room => {}
        response.should redirect_to(tasting_room_url(mock_tasting_room))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tasting_room as @tasting_room" do
        TastingRoom.stub(:new).with({'these' => 'params'}) { mock_tasting_room(:save => false) }
        post :create, :tasting_room => {'these' => 'params'}
        assigns(:tasting_room).should be(mock_tasting_room)
      end

      it "re-renders the 'new' template" do
        TastingRoom.stub(:new) { mock_tasting_room(:save => false) }
        post :create, :tasting_room => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested tasting_room" do
        TastingRoom.should_receive(:find).with("37") { mock_tasting_room }
        mock_tasting_room.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tasting_room => {'these' => 'params'}
      end

      it "assigns the requested tasting_room as @tasting_room" do
        TastingRoom.stub(:find) { mock_tasting_room(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:tasting_room).should be(mock_tasting_room)
      end

      it "redirects to the tasting_room" do
        TastingRoom.stub(:find) { mock_tasting_room(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(tasting_room_url(mock_tasting_room))
      end
    end

    describe "with invalid params" do
      it "assigns the tasting_room as @tasting_room" do
        TastingRoom.stub(:find) { mock_tasting_room(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:tasting_room).should be(mock_tasting_room)
      end

      it "re-renders the 'edit' template" do
        TastingRoom.stub(:find) { mock_tasting_room(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested tasting_room" do
      TastingRoom.should_receive(:find).with("37") { mock_tasting_room }
      mock_tasting_room.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the tasting_rooms list" do
      TastingRoom.stub(:find) { mock_tasting_room }
      delete :destroy, :id => "1"
      response.should redirect_to(tasting_rooms_url)
    end
  end

end
