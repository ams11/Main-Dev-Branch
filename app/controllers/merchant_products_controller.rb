class MerchantProductsController < ApplicationController
  filter_access_to :all

  def index
	mp = MerchantProduct.new(current_user.shopify_product_vendor)
    @products = mp.all
  end

  def show
  end

  def edit
  end

  def new
	@product = Product.new(current_user.shopify_product_vendor)
  end

  def create
  end

  def destroy
  end

end
