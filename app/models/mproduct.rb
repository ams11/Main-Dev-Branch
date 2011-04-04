class Mproduct
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  ShopifyAPI::Base.site = 'http://' + APP_CONFIG['shopify_api_key'] + ':' + APP_CONFIG['shopify_password'] + '@' + APP_CONFIG['shopify_store_url'] + '/admin'

  attr_accessor :id, :product_type, :product_category, :title, :body_html, :color, :gender, :brand, :onsale, :collectible, :custom, :vendor
  
  validates_presence_of :product_type, :product_category, :title, :body_html, :color, :gender, :brand, :onsale, :collectible, :custom, :vendor
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def save
    if ret = valid?
      attributes = {}
      instance_variables.each do |name|
        value = instance_variable_get(name)
        attributes[name.sub(/^@/,'')] = value if !value.nil? and !value.empty?
      end
      Rails.logger.debug "attributes=#{attributes}"
      ShopifyAPI::Product.new(attributes).save
    end
    ret
  end
  
  def persisted?
    false
  end
  
  private
  
  def productNew
  end

  end

