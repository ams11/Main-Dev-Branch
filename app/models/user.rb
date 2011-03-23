class User < ActiveRecord::Base
  acts_as_authentic
  
  serialize :roles, Array
  
  validates_length_of :shopify_product_vendor, :maximum => 30
  validates_uniqueness_of :shopify_product_vendor, :case_sensitive => false, :allow_nil => true

  def role_symbols
	@role_symbols ||= (roles || []).map {|r| r.to_sym}
  end
  
end
