class CreateSproducts < ActiveRecord::Migration
  def self.up
    create_table :sproducts do |t|
      t.integer :id
      t.string :product_type
      t.string :product_category
      t.string :title
      t.text :body_html
      t.string :color
      t.string :gender
      t.string :brand
      t.string :onsale
      t.string :collectible
      t.string :custom
      t.string :vendor

      t.timestamps
    end
  end

  def self.down
    drop_table :sproducts
  end
end
