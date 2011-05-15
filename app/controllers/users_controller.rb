class UsersController < ApplicationController
  filter_access_to :all

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
	if @user.roles.nil?
		@user.roles = [:member];
	elsif @user.roles.size == 0
		@user.roles.push(:member)
	end
    if @user.save
      Sproduct.find_or_create_merchant_collection(@user.shopify_product_vendor) if !@user.shopify_product_vendor.blank?
      redirect_to root_url, :notice => "Sign Up successful."
    else
      render :action => 'new'
    end
  end

  def edit
	if has_role? :admin and params[:id] != "current"
		@user = User.find(params[:id])
	else
		@user = current_user
	end
  end

  def update
	if has_role? :admin and params[:id] != "current"
		@user = User.find(params[:id])
	else
		@user = current_user
	end
    if @user.update_attributes(params[:user])
      Sproduct.find_or_create_merchant_collection(@user.shopify_product_vendor) if !@user.shopify_product_vendor.blank?
      redirect_to root_url, :notice  => "Successfully updated profile."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    #FIX: delete vendor smart collection

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
end
