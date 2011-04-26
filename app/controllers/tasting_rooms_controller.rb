class TastingRoomsController < ApplicationController
  # GET /tasting_rooms
  # GET /tasting_rooms.xml
  def index
    @tasting_rooms = TastingRoom.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasting_rooms }
    end
  end

  # GET /tasting_rooms/1
  # GET /tasting_rooms/1.xml
  def show
    @tasting_room = TastingRoom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tasting_room }
    end
  end

  # GET /tasting_rooms/new
  # GET /tasting_rooms/new.xml
  def new
    @tasting_room = TastingRoom.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tasting_room }
    end
  end

  # GET /tasting_rooms/1/edit
  def edit
    @tasting_room = TastingRoom.find(params[:id])
  end

  # POST /tasting_rooms
  # POST /tasting_rooms.xml
  def create
    @tasting_room = TastingRoom.new(params[:tasting_room])

    respond_to do |format|
      if @tasting_room.save
        format.html { redirect_to(@tasting_room, :notice => 'Tasting room was successfully created.') }
        format.xml  { render :xml => @tasting_room, :status => :created, :location => @tasting_room }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tasting_room.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasting_rooms/1
  # PUT /tasting_rooms/1.xml
  def update
    @tasting_room = TastingRoom.find(params[:id])

    respond_to do |format|
      if @tasting_room.update_attributes(params[:tasting_room])
        format.html { redirect_to(@tasting_room, :notice => 'Tasting room was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tasting_room.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasting_rooms/1
  # DELETE /tasting_rooms/1.xml
  def destroy
    @tasting_room = TastingRoom.find(params[:id])
    @tasting_room.destroy

    respond_to do |format|
      format.html { redirect_to(tasting_rooms_url) }
      format.xml  { head :ok }
    end
  end
end
