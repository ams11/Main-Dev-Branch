class PagesController < ApplicationController
  filter_access_to :all

  def home
  end

  def visitor
  end

  def member
  end

  def merchant
    @countProducts = Sproduct.count({:vendor => current_user.shopify_product_vendor})
    @countOpenOrders = Sorder.countOpen
  end

  def admin
  end

end
