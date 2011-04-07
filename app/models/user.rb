class User < ActiveRecord::Base
  acts_as_authentic
  
  serialize :roles, Array
  
  validates_length_of :shopify_product_vendor, :maximum => 30
  validates_uniqueness_of :shopify_product_vendor, :case_sensitive => false, :allow_nil => true

  def role_symbols
	@role_symbols ||= (roles || []).map {|r| r.to_sym}
  end
  
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  username               :string(255)
#  email                  :string(255)
#  crypted_password       :string(255)
#  password_salt          :string(255)
#  persistence_token      :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  roles                  :text
#  shopify_product_vendor :string(255)
#

