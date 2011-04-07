class CreateSproductVariants < ActiveRecord::Migration
  def self.up
    create_table :sproduct_variants do |t|
      t.integer :sproduct_id
      t.string :sku
      t.decimal :price
      t.string :size

      t.timestamps
    end
  end

  def self.down
    drop_table :sproduct_variants
  end
end
