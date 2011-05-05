class TastingRoomsController < ApplicationController
  
  before_filter :authenticate_user!
  
  # GET /tasting_rooms
  def index
    @winery = Winery.find(params[:winery_id])
    @tasting_rooms = @winery.tasting_rooms

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasting_rooms }
    end
  end

  # GET /tasting_rooms/1
  def show
    @winery = Winery.find(params[:winery_id])
    @tasting_room = TastingRoom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tasting_room }
    end
  end

  # GET /tasting_rooms/new
  def new
    @winery = Winery.find(params[:winery_id])
    @tasting_room = @winery.tasting_rooms.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tasting_room }
    end
  end

  # GET /tasting_rooms/1/edit
  def edit
    @winery = Winery.find(params[:winery_id])
    @tasting_room = TastingRoom.find(params[:id])
  end

  # POST /tasting_rooms
  def create
    @winery = Winery.find(params[:winery_id])
    @tasting_room = @winery.tasting_rooms.build(params[:tasting_room])

    respond_to do |format|
      if @tasting_room.save
        format.html { redirect_to(winery_tasting_rooms_path(@winery), :notice => 'Tasting room was successfully created.') }
        format.xml  { render :xml => @tasting_room, :status => :created, :location => @tasting_room }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tasting_room.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasting_rooms/1
  def update
    @winery = Winery.find(params[:winery_id])
    @tasting_room = TastingRoom.find(params[:id])

    respond_to do |format|
      if @tasting_room.update_attributes(params[:tasting_room])
        format.html { redirect_to(winery_tasting_rooms_path(@winery), :notice => 'Tasting room was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tasting_room.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasting_rooms/1
  def destroy
    @winery = Winery.find(params[:winery_id])
    @tasting_room = TastingRoom.find(params[:id])
    @tasting_room.destroy

    respond_to do |format|
      format.html { redirect_to(winery_tasting_rooms_url(@winery)) }
      format.xml  { head :ok }
    end
  end
end
