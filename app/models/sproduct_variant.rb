class SproductVariant < ActiveRecord::Base
  belongs_to :sproduct
end

# == Schema Information
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
