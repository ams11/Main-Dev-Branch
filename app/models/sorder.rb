class Sorder
  ShopifyAPI::Base.site = 'http://' + APP_CONFIG['shopify_api_key'] + ':' + APP_CONFIG['shopify_password'] + '@' + APP_CONFIG['shopify_store_url'] + '/admin'

  def self.countOpen
    begin
      ShopifyAPI::Order.count()
    rescue
      "Lookup failed"
    end
  end
  
end

