class Mproduct
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :product_type, :title, :body_html, :vendor
  
  def initialize(attributes = {})
    attributes.each do |name, value|
	  send("#{name}=", value)
	end
	setup
  end
  
  def save
	ShopifyAPI::Product.create({
		'product-type' => @product_type,
		'title' => @title,
		'body-html' => @body_html,
		'vendor' => @vendor
	})
  end
  
  def persisted?
    false
  end

  private
  
  def setup
    ShopifyAPI::Base.site = 'http://' + APP_CONFIG['shopify_api_key'] + ':' + APP_CONFIG['shopify_password'] + '@' + APP_CONFIG['shopify_store_url'] + '/admin'
  end
  
end 