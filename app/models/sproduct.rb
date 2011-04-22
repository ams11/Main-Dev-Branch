class Sproduct < ActiveRecord::Base
  has_many :sproduct_variants, :dependent => :destroy
  accepts_nested_attributes_for :sproduct_variants, :allow_destroy => true
  
  has_attached_file :picture,
    :storage => :s3,
    :bucket => 'dev.soletron.com',
    :path => 'prod',
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml"
    #:s3_credentials => {
    #  :access_key_id => 'AKIAIYLNZCHSQSVA2WRQ',
    #  :secret_access_key => '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'
    #}
  
  validates_presence_of :title, :body_html
  
  ShopifyAPI::Base.site = 'http://' + APP_CONFIG['shopify_api_key'] + ':' + APP_CONFIG['shopify_password'] + '@' + APP_CONFIG['shopify_store_url'] + '/admin'

  def self.count(attributes = {})
    begin
      where("vendor = ?", attributes[:vendor]).count
    rescue
      "Lookup failed"
    end
  end
  
  def self.find_or_create_custom_collection(title)
    if c = ShopifyAPI::CustomCollection.find(:all, :params => {:title => title}).size > 0
      ShopifyAPI::CustomCollection.find(:all, :params => {:title => title}).first
    else
      ShopifyAPI::CustomCollection.create(:title => title)
    end
  end
  
  def initialize(attributes = {})
    @attributes = attributes
    super(attributes)
  end
  
  alias :super_save :save
  
  def save(*args)
    ret = super(args)
    if ret
      # At this point, the sproduct and attached sproduct_variants have been saved.
      is_new_shopify_product = self.shopify_product_id.to_s.blank?
      
      shopify_attributes = @attributes.dup
      add_tags_to_attributes!(shopify_attributes)
      replace_id_with_shopify_product_id!(shopify_attributes)
      
      shopify_attributes["options"] = [{"name" => "Size"}]
      shopify_attributes["variants"] = @sproduct_variants.collect do |variant|
        { "sku" => "#{variant.sku}", "price" => "#{variant.price}", "option1" => "#{variant.size}" }
      end
      shopify_attributes["images"] = [{"src" => self.picture.url}] if self.picture.exists?
      
      if is_new_shopify_product
        if p = ShopifyAPI::Product.create(shopify_attributes)
          self.shopify_product_id = p.id
          super_save

          p.add_metafield(ShopifyAPI::Metafield.new({
            :namespace => "ext",
            :key => "product_category",
            :value => self.product_category,
            :value_type => 'string'
          }))
       
          Sproduct.find_or_create_custom_collection("#{self.product_type}-#{self.product_category}").add_product(p)
        end
      else
        Rails.logger.debug "shopify_attrbiutes = #{shopify_attributes.to_yaml}"
        p = ShopifyAPI::Product.find(self.shopify_product_id, :params => {  })
        if p
          x = p.update_attributes(shopify_attributes)
          Rails.logger.debug "x = #{x.to_yaml}"
        end
    end
      
    end
    
    ret
  end
  
  def destroy
    if !self.shopify_product_id.to_s.blank?
      begin
        p = ShopifyAPI::Product.find(self.shopify_product_id)
        p.destroy
      rescue
      end
    end
    super
  end
  
  private
  
  def replace_id_with_shopify_product_id!(a)
    a.delete("id") if a["shopify_product_id"].to_s.blank?
    a["id"] = a["shopify_product_id"] if !a["shopify_product_id"].to_s.blank?
  end
  
  def add_tags_to_attributes!(a)
    a['tags'] = "color:#{a['color']}, gender:#{a['gender']}, brand:#{a['brand']}, onsale:#{a['onsale']}, collectible:#{a['collectible']}, custom:#{a['custom']}"
  end
  
end

# == Schema Information
#
# Table name: sproducts
#
#  id                 :integer         not null, primary key
#  product_type       :string(255)
#  product_category   :string(255)
#  title              :string(255)
#  body_html          :text
#  color              :string(255)
#  gender             :string(255)
#  brand              :string(255)
#  onsale             :string(255)
#  collectible        :string(255)
#  custom             :string(255)
#  vendor             :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  shopify_product_id :integer
#

