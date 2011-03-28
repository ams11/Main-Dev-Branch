class Mproduct
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :id, :product_type, :title, :body_html, :vendor
  
  def initialize(attributes = {})
    attributes.each do |name, value|
	  send("#{name}=", value)
    end
    setup
  end
  
  def find(id)
    ShopifyAPI::Product.find(id, :params => { :vendor => @vendor })
  end

  def load(id)
    p = ShopifyAPI::Product.find(id, :params => { :vendor => @vendor })
    Rails.logger.debug "p=#{p.inspect}"
    @id = p.id;
    @product_type = p.product_type;
    @title = p.title;
    @body_html = p.body_html;
    @vendor = p.vendor;
    self
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