class MproductsController < ApplicationController
  ShopifyAPI::Base.site = 'http://' + APP_CONFIG['shopify_api_key'] + ':' + APP_CONFIG['shopify_password'] + '@' + APP_CONFIG['shopify_store_url'] + '/admin'

  DEFAULT_ATTRIBUTES = {
    :product_type => '',
    :title => '',
    :body_html => ''
  }
  
    # GET /mproducts
  # GET /mproducts.xml
  def index
    @mproducts = ShopifyAPI::Product.find(:all, :params => { :vendor => current_user.shopify_product_vendor })
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mproducts }
    end
  end

  # GET /mproducts/1
  # GET /mproducts/1.xml
  def show
    @mproduct = ShopifyAPI::Product.find(params[:id], :params => { :vendor => current_user.shopify_product_vendor })

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mproduct }
    end
  end

  # GET /mproducts/new
  # GET /mproducts/new.xml
  def new
    @mproduct = Mproduct.new({:vendor => current_user.shopify_product_vendor})
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mproduct }
    end
  end

  # GET /mproducts/1/edit
  def edit
    @mproduct = Mproduct.new().find(params[:id], current_user.shopify_product_vendor)
  end

  # POST /mproducts
  # POST /mproducts.xml
  def create
    Rails.logger.debug "create:params = #{params.to_yaml}"
    
    @mproduct = Mproduct.new(params[:mproduct])
    respond_to do |format|
      if @mproduct.create
        format.html { redirect_to(mproducts_path, :notice => 'Mproduct was successfully created.') }
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
    @mproduct = Mproduct.new.find(params[:id], current_user.shopify_product_vendor).update_attributes(params[:mproduct])
    respond_to do |format|
      if @mproduct.save
        format.html { redirect_to(mproducts_path, :notice => 'Mproduct was successfully updated.') }
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
    @mproduct = ShopifyAPI::Product.find(params[:id], :params => { :vendor => current_user.shopify_product_vendor })
    @mproduct.destroy

    respond_to do |format|
      format.html { redirect_to(mproducts_url) }
      format.xml  { head :ok }
    end
  end
end
