class Mproduct
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  ShopifyAPI::Base.site = 'http://' + APP_CONFIG['shopify_api_key'] + ':' + APP_CONFIG['shopify_password'] + '@' + APP_CONFIG['shopify_store_url'] + '/admin'

  attr_accessor :id, :product_type, :title, :body_html, :vendor
  
  validates_presence_of :product_type, :title, :body_html, :vendor
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def save
    instance_variables.each do |name|
      Rails.logger.debug "#{name} = #{instance_variable_get(name)},#{instance_variable_get(name).class}"
    end
    
    if ret = valid?
      attributes = {}
      instance_variables.each do |name|
        Rails.logger.debug "#{name}, #{name == :id}, #{name == "id"}"
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

