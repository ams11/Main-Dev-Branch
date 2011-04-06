class Mproduct
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  ShopifyAPI::Base.site = 'http://' + APP_CONFIG['shopify_api_key'] + ':' + APP_CONFIG['shopify_password'] + '@' + APP_CONFIG['shopify_store_url'] + '/admin'

  attr_accessor :id, :product_type, :product_category, :title, :body_html, :color, :gender, :brand, :onsale, :collectible, :custom, :vendor
  
  validates_presence_of :product_type, :product_category, :title, :body_html, :color, :gender, :brand, :onsale, :collectible, :custom, :vendor
  #validates :price, :presence => true, :numericality => {:greater_than_or_equal_to => MERCHANT_CONFIG['constraints']['min_product_price'].to_f, :less_than_or_equal_to => MERCHANT_CONFIG['constraints']['max_product_price'].to_f}
  
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
    if c = ShopifyAPI::CustomCollection.find(:all, :params => {:title => title}).size > 0
      ShopifyAPI::CustomCollection.find(:all, :params => {:title => title}).first
    else
      ShopifyAPI::CustomCollection.create(:title => title)
    end
  end
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
    @attributes = attributes
  end
  
  def update_attributes(attributes = {})
    initialize(attributes)
    self
  end
  
  def find(id, vendor)
    @shopify_product = ShopifyAPI::Product.find(id, :params => { :vendor => vendor })
    deserialize
    self
  end
  
  def create
    return false if !valid?

    add_tags_to_attributes!(@attributes)
    p = ShopifyAPI::Product.create(@attributes)
    
    if p
      @id = p.id

      ret = p.add_metafield(ShopifyAPI::Metafield.new({
        :namespace => "ext",
        :key => "product_category",
        :value => @product_category,
        :value_type => 'string'
      }))
   
      Mproduct.find_or_create_custom_collection("#{@product_type}-#{@product_category}").add_product(p)
    end
    p
  end
  
  def save
    return false if !valid?

    add_tags_to_attributes!(@attributes)
    @shopify_product.update_attributes(@attributes)
  end
  
  def persisted?
    !@shopify_product.nil?
  end
  
  private
  
  @shopify_product = nil
  @attributes = {}
  
  def serialize
    attributes = {}
    instance_variables.each do |name|
      value = instance_variable_get(name)
      attributes[name.sub(/^@/,'')] = value if !value.nil? and !value.empty?
    end
    attributes['tags'] = tags
    
    return attributes
  end

  def deserialize
    p = @shopify_product
    
     # simple scalar attributes
    @id = p.id
    @product_type = p.product_type
    @title = p.title
    @body_html = p.body_html
    @vendor = p.vendor

    # scalar metafields
    p.metafields.each do |m|
      case m.key
        when "product_category" then instance_variable_set("@#{m.key}", m.value)
      end
    end
    
    # scalar tags
    p.tags.split(",").each do |tag|
      a = tag.strip.split(":",2)
      case a.first
        when "gender", "brand", "onsale", "collectible", "custom", "color" then instance_variable_set("@#{a.first}", a.last)
      end
    end
  end
  
  def tags
    "color:#{@color}, gender:#{@gender}, brand:#{@brand}, onsale:#{@onsale}, collectible:#{@collectible}, custom:#{@custom}"
  end
  
  def add_tags_to_attributes!(a)
    a['tags'] = "color:#{a['color']}, gender:#{a['gender']}, brand:#{a['brand']}, onsale:#{a['onsale']}, collectible:#{a['collectible']}, custom:#{a['custom']}"
  end
  
end

