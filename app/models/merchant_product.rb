class MerchantProduct
  def initialize(vendor)
    @vendor = vendor
  end
  
  def all
	msg = "all: vendor=" + @vendor
    setup
    products = ShopifyAPI::Product.find(:all, :params => { :vendor => @vendor })
	msg += " products.size=" + products.size.to_s
  end

  private
  
  def setup
    #ShopifyAPI::Base.site = "http://d963d21dd5b552733730ef383c77f126:c1370605f6e060b2c420839106a7dc50@soletron.myshopify.com/admin"
    ShopifyAPI::Base.site = 'http://' + APP_CONFIG['shopify_api_key'] + ':' + APP_CONFIG['shopify_password'] + '@' + APP_CONFIG['shopify_store_url'] + '/admin'
  end
  
end
