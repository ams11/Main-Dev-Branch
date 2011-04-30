

class Product < ActiveResource::Base
  self.site = 'http://' + APP_CONFIG['shopify_api_key'] + ':' + APP_CONFIG['shopify_password'] + '@' + APP_CONFIG['shopify_store_url'] + '/admin'
  Rails.logger.debug "self.site= #{self.site}"
end

