require 'test_helper'

class SproductVariantTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

