require 'test_helper'

class SproductTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Information
#
# Table name: sproducts
#
#  id                   :integer         not null, primary key
#  product_type         :string(255)
#  product_category     :string(255)
#  title                :string(255)
#  body_html            :text
#  color                :string(255)
#  gender               :string(255)
#  brand                :string(255)
#  onsale               :string(255)
#  collectible          :string(255)
#  custom               :string(255)
#  vendor               :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  shopify_product_id   :integer
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

