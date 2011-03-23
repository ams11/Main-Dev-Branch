class CreateMproducts < ActiveRecord::Migration
  def self.up
    create_table :mproducts do |t|
      t.string :product_type
      t.string :title
      t.string :body_html
      t.string :vendor

      t.timestamps
    end
  end

  def self.down
    drop_table :mproducts
  end
end
