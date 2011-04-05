class Mproduct
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  ShopifyAPI::Base.site = 'http://' + APP_CONFIG['shopify_api_key'] + ':' + APP_CONFIG['shopify_password'] + '@' + APP_CONFIG['shopify_store_url'] + '/admin'

  attr_accessor :id, :product_type, :product_category, :title, :body_html, :color, :gender, :brand, :onsale, :collectible, :custom, :vendor
  
  validates_presence_of :product_type, :product_category, :title, :body_html, :color, :gender, :brand, :onsale, :collectible, :custom, :vendor
  
  def self.smart_collections
    ShopifyAPI::SmartCollection.find(:all).size()
  end
  
  def self.custom_collections
    ShopifyAPI::CustomCollection.find(:all).size()
  end
  
  def self.custom_collection(title)
    ShopifyAPI::CustomCollection.find(:all, :params => {:title => title}).size()
  end
  
  def self.find_or_create_custom_collection(title)
    if ShopifyAPI::CustomCollection.find(:all, :params => {:title => title}).size() > 0
      ShopifyAPI::CustomCollection.find(:all, :params => {:title => title})
    else
      ShopifyAPI::CustomCollection.create(:title => title)
    end
  end
  
  def self.add_product_to_custom_collection(product_id, collection_title)
    c = find_or_create_custom_collection(collection_title)
    ShopifyAPI::Collect.create(:product_id => product_id, :collection_id => c.id)
  end
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def find(id, vendor)
    p = ShopifyAPI::Product.find(id, :params => { :vendor => vendor })
    Rails.logger.debug "p = #{p.inspect}"
    instance_variables.each do |name|
      instance_variable_set(name, p[name])
    end
    self
  end
  
  def save
    if ret = valid?
      attributes = {}
      instance_variables.each do |name|
        value = instance_variable_get(name)
        attributes[name.sub(/^@/,'')] = value if !value.nil? and !value.empty?
      end
      attributes['tags'] = tags
      p = ShopifyAPI::Product.create(attributes)
      @id = p.id if p
      p
    end
    ret
  end
  
  def persisted?
    false
  end
  
  def tags
    "color:#{@color}, gender:#{@gender}, brand:#{@brand}, onsale:#{@onsale}, collectible:#{@collectible}, custom:#{@custom}"
  end
  
  end

