class AddShopifyVendorToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :shopify_product_vendor, :string
  end

  def self.down
    remove_column :users, :shopify_product_vendor
  end
end
