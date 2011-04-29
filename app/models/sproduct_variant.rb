class SproductVariant < ActiveRecord::Base
  belongs_to :sproduct
  
  validates_presence_of :sku, :price
  
end

# == Schema Informations
#
# Table name: sproduct_variants
#
#  id          :integer         not null, primary key
#  sproduct_id :integer
#  sku         :string(255)
#  price       :decimal(, )
#  size        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

