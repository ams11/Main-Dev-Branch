
# This class must cache the open order results for a period of time so we don't
# exceed the API call limit.  We should cache open order counts and status by Merchant
# and refresh every few minutes (once an hour?).

class Sorder
  ShopifyAPI::Base.site = 'http://' + APP_CONFIG['shopify_api_key'] + ':' + APP_CONFIG['shopify_password'] + '@' + APP_CONFIG['shopify_store_url'] + '/admin'

  def self.countOpen(attributes = {})
    begin
      allOpenOrders = ShopifyAPI::Order.find(:all, :params => {:status => "open"})
      @orders = forVendor(allOpenOrders, attributes[:vendor])
      @orders.size
    rescue
      "Lookup failed"
    end
  end
  
  private
  
  def self.forVendor(orders = [], vendor = "")
    orders.select do |o|
      o.line_items.delete_if { |li| li.vendor != vendor }
      !o.line_items.empty?
    end
  end
  
end

