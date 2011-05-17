class AddFeaturedToSproducts < ActiveRecord::Migration
  def self.up
    add_column :sproducts, :featured, :string
  end

  def self.down
    remove_column :sproducts, :featured
  end
end
