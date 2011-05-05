class VarietalsController < ApplicationController
  
  before_filter :authenticate_user!
  
  # GET /varietals
  # GET /varietals.xml
  def index
    @varietals = Varietal.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @varietals }
    end
  end

  # GET /varietals/1
  # GET /varietals/1.xml
  def show
    @varietal = Varietal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @varietal }
    end
  end

  # GET /varietals/new
  # GET /varietals/new.xml
  def new
    @varietal = Varietal.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @varietal }
    end
  end

  # GET /varietals/1/edit
  def edit
    @varietal = Varietal.find(params[:id])
  end

  # POST /varietals
  # POST /varietals.xml
  def create
    @varietal = Varietal.new(params[:varietal])

    respond_to do |format|
      if @varietal.save
        format.html { redirect_to(varietals_path, :notice => 'Varietal was successfully created.') }
        format.xml  { render :xml => @varietal, :status => :created, :location => @varietal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @varietal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /varietals/1
  # PUT /varietals/1.xml
  def update
    @varietal = Varietal.find(params[:id])

    respond_to do |format|
      if @varietal.update_attributes(params[:varietal])
        format.html { redirect_to(varietals_path, :notice => 'Varietal was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @varietal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /varietals/1
  # DELETE /varietals/1.xml
  def destroy
    @varietal = Varietal.find(params[:id])
    @varietal.destroy

    respond_to do |format|
      format.html { redirect_to(varietals_url) }
      format.xml  { head :ok }
    end
  end
end
