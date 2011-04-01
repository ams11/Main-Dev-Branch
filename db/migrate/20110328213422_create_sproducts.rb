class CreateSproducts < ActiveRecord::Migration
  def self.up
    create_table :sproducts do |t|
      t.string :id
      t.string :vendor
      t.string :product_type
      t.string :title
      t.string :body_html

      t.timestamps
    end
  end

  def self.down
    drop_table :sproducts
  end
end
