class AddShopifyProductIdToSproduct < ActiveRecord::Migration
  def self.up
    add_column :sproducts, :shopify_product_id, :integer
  end

  def self.down
    remove_column :sproducts, :shopify_product_id
  end
end
