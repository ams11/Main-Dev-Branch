class SproductsController < ApplicationController
  filter_access_to :all

  # GET /sproducts
  # GET /sproducts.xml
  def index
    @sproducts = Sproduct.where("vendor = ?", current_user.shopify_product_vendor)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sproducts }
    end
  end

  # GET /sproducts/1
  # GET /sproducts/1.xml
  def show
    @sproduct = Sproduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sproduct }
    end
  end

  # GET /sproducts/new
  # GET /sproducts/new.xml
  def new
    @sproduct = Sproduct.new({:vendor => current_user.shopify_product_vendor})
    @sproduct.sproduct_variants.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sproduct }
    end
  end

  # GET /sproducts/1/edit
  def edit
    @sproduct = Sproduct.find(params[:id])
  end

  # POST /sproducts
  # POST /sproducts.xml
  def create
    Rails.logger.debug "sproduct.create========================================="
    Rails.logger.debug "params = #{params.to_yaml}"
    
    if params[:commit] == "Cancel" then
      redirect_to sproducts_path
      return
    end
    
    @sproduct = Sproduct.new(params[:sproduct])

    respond_to do |format|
      if @sproduct.save
        format.html { redirect_to(@sproduct, :notice => 'Sproduct was successfully created.') }
        format.xml  { render :xml => @sproduct, :status => :created, :location => @sproduct }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sproduct.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sproducts/1
  # PUT /sproducts/1.xml
  def update
    @sproduct = Sproduct.find(params[:id])

    respond_to do |format|
      if @sproduct.update_attributes(params[:sproduct])
        format.html { redirect_to(@sproduct, :notice => 'Sproduct was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sproduct.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sproducts/1
  # DELETE /sproducts/1.xml
  def destroy
    @sproduct = Sproduct.find(params[:id])
    @sproduct.destroy

    respond_to do |format|
      format.html { redirect_to(sproducts_url) }
      format.xml  { head :ok }
    end
  end
end
