class VarietiesController < ApplicationController
  # GET /varieties
  # GET /varieties.xml
  def index
    @varieties = Variety.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @varieties }
    end
  end

  # GET /varieties/1
  # GET /varieties/1.xml
  def show
    @variety = Variety.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @variety }
    end
  end

  # GET /varieties/new
  # GET /varieties/new.xml
  def new
    @variety = Variety.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @variety }
    end
  end

  # GET /varieties/1/edit
  def edit
    @variety = Variety.find(params[:id])
  end

  # POST /varieties
  # POST /varieties.xml
  def create
    @variety = Variety.new(params[:variety])

    respond_to do |format|
      if @variety.save
        format.html { redirect_to(@variety, :notice => 'Variety was successfully created.') }
        format.xml  { render :xml => @variety, :status => :created, :location => @variety }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @variety.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /varieties/1
  # PUT /varieties/1.xml
  def update
    @variety = Variety.find(params[:id])

    respond_to do |format|
      if @variety.update_attributes(params[:variety])
        format.html { redirect_to(@variety, :notice => 'Variety was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @variety.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /varieties/1
  # DELETE /varieties/1.xml
  def destroy
    @variety = Variety.find(params[:id])
    @variety.destroy

    respond_to do |format|
      format.html { redirect_to(varieties_url) }
      format.xml  { head :ok }
    end
  end
end
