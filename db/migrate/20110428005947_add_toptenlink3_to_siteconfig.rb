class AddToptenlink3ToSiteconfig < ActiveRecord::Migration
  def self.up
    add_column :siteconfigs, :topten_link_3, :string
  end

  def self.down
    remove_column :siteconfigs, :topten_link_3
  end
end
