class CreateStoreconfigs < ActiveRecord::Migration
  def self.up
    create_table :storeconfigs do |t|
      t.integer :user_id
      t.string :display_name

      t.timestamps
    end
  end

  def self.down
    drop_table :storeconfigs
  end
end
