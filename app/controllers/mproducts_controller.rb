class MproductsController < ApplicationController
  # GET /mproducts
  # GET /mproducts.xml
  def index
    #@mproducts = Mproduct.all
    @mproducts = []

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mproducts }
    end
  end

  # GET /mproducts/1
  # GET /mproducts/1.xml
  def show
    #@mproduct = Mproduct.find(params[:id])
    @mproduct = nil

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mproduct }
    end
  end

  # GET /mproducts/new
  # GET /mproducts/new.xml
  def new
    @mproduct = Mproduct.new(:vendor => current_user.shopify_product_vendor)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mproduct }
    end
  end

  # GET /mproducts/1/edit
  def edit
    #@mproduct = Mproduct.find(params[:id])
    @mproduct = nil
  end

  # POST /mproducts
  # POST /mproducts.xml
  def create
    @mproduct = Mproduct.new(params[:mproduct])

    respond_to do |format|
      if @mproduct.save
        format.html { redirect_to(@mproduct, :notice => 'Mproduct was successfully created.') }
        format.xml  { render :xml => @mproduct, :status => :created, :location => @mproduct }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mproduct.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mproducts/1
  # PUT /mproducts/1.xml
  def update
    #@mproduct = Mproduct.find(params[:id])
    @mproduct = nil

    respond_to do |format|
      if @mproduct.update_attributes(params[:mproduct])
        format.html { redirect_to(@mproduct, :notice => 'Mproduct was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mproduct.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mproducts/1
  # DELETE /mproducts/1.xml
  def destroy
    #@mproduct = Mproduct.find(params[:id])
    #@mproduct.destroy
    @mproduct = nil

    respond_to do |format|
      format.html { redirect_to(mproducts_url) }
      format.xml  { head :ok }
    end
  end
end
