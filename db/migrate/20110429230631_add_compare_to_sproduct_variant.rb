class AddCompareToSproductVariant < ActiveRecord::Migration
  def self.up
    add_column :sproduct_variants, :compare_to_price, :decimal
  end

  def self.down
    remove_column :sproduct_variants, :compare_to_price
  end
end
