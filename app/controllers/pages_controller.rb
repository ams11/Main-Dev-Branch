class PagesController < ApplicationController
  filter_access_to :all

  def home
    @siteconfig = Siteconfig.instance
  end

  def visitor
  end

  def member
  end

  def merchant
    @countProducts = Sproduct.count({:vendor => current_user.shopify_product_vendor})
    @countOpenOrders = Sorder.countOpen({:vendor => current_user.shopify_product_vendor})
  end

  def admin
  end

end
