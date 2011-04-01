class Sproduct < ShopifyAPI::Product
  ShopifyAPI::Base.site = 'http://' + APP_CONFIG['shopify_api_key'] + ':' + APP_CONFIG['shopify_password'] + '@' + APP_CONFIG['shopify_store_url'] + '/admin'

  Rails.logger.debug "ShopifyAPI::Product.find(:all) = #{ ShopifyAPI::Product.find(:all) }"
  Rails.logger.debug "Sproduct.find(:all) = #{ Sproduct.find(:all) }"
  
  end
 