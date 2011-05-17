class StoreconfigsController < ApplicationController
  # GET /storeconfigs
  # GET /storeconfigs.xml
  def index
    @storeconfigs = Storeconfig.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @storeconfigs }
    end
  end

  # GET /storeconfigs/1
  # GET /storeconfigs/1.xml
  def show
    @storeconfig = Storeconfig.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @storeconfig }
    end
  end

  # GET /storeconfigs/new
  # GET /storeconfigs/new.xml
  def new
    @storeconfig = Storeconfig.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @storeconfig }
    end
  end

  # GET /storeconfigs/1/edit
  def edit
    @storeconfig = Storeconfig.find(params[:id])
  end

  # POST /storeconfigs
  # POST /storeconfigs.xml
  def create
    @storeconfig = Storeconfig.new(params[:storeconfig])

    respond_to do |format|
      if @storeconfig.save
        format.html { redirect_to(@storeconfig, :notice => 'Storeconfig was successfully created.') }
        format.xml  { render :xml => @storeconfig, :status => :created, :location => @storeconfig }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @storeconfig.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /storeconfigs/1
  # PUT /storeconfigs/1.xml
  def update
    @storeconfig = Storeconfig.find(params[:id])

    respond_to do |format|
      if @storeconfig.update_attributes(params[:storeconfig])
        format.html { redirect_to(@storeconfig, :notice => 'Storeconfig was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @storeconfig.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /storeconfigs/1
  # DELETE /storeconfigs/1.xml
  def destroy
    @storeconfig = Storeconfig.find(params[:id])
    @storeconfig.destroy

    respond_to do |format|
      format.html { redirect_to(storeconfigs_url) }
      format.xml  { head :ok }
    end
  end
end
