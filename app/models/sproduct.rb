class Sproduct < ActiveRecord::Base
  has_many :sproduct_variants, :dependent => :destroy
  accepts_nested_attributes_for :sproduct_variants, :allow_destroy => true
  
  validates_presence_of :title
  
  def initialize(attributes = {})
    @attributes = attributes
    super(attributes)
  end
  
  def save
    if ret = super

      add_tags_to_attributes!(@attributes)
      if p = ShopifyAPI::Product.create(@attributes)
        @id = p.id

        ret = p.add_metafield(ShopifyAPI::Metafield.new({
          :namespace => "ext",
          :key => "product_category",
          :value => @product_category,
          :value_type => 'string'
        }))
     
        Mproduct.find_or_create_custom_collection("#{@product_type}-#{@product_category}").add_product(p)
      end

    end
    
    ret
  end
  
end
