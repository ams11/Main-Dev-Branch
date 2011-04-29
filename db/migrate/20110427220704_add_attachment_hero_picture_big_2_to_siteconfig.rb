class AddAttachmentHeroPictureBig2ToSiteconfig < ActiveRecord::Migration
  def self.up
    add_column :siteconfigs, :hero_picture_big_2_file_name, :string
    add_column :siteconfigs, :hero_picture_big_2_content_type, :string
    add_column :siteconfigs, :hero_picture_big_2_file_size, :integer
    add_column :siteconfigs, :hero_picture_big_2_updated_at, :datetime
  end

  def self.down
    remove_column :siteconfigs, :hero_picture_big_2_file_name
    remove_column :siteconfigs, :hero_picture_big_2_content_type
    remove_column :siteconfigs, :hero_picture_big_2_file_size
    remove_column :siteconfigs, :hero_picture_big_2_updated_at
  end
end
