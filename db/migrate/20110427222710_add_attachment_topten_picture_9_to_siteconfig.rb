class AddAttachmentToptenPicture9ToSiteconfig < ActiveRecord::Migration
  def self.up
    add_column :siteconfigs, :topten_picture_9_file_name, :string
    add_column :siteconfigs, :topten_picture_9_content_type, :string
    add_column :siteconfigs, :topten_picture_9_file_size, :integer
    add_column :siteconfigs, :topten_picture_9_updated_at, :datetime
  end

  def self.down
    remove_column :siteconfigs, :topten_picture_9_file_name
    remove_column :siteconfigs, :topten_picture_9_content_type
    remove_column :siteconfigs, :topten_picture_9_file_size
    remove_column :siteconfigs, :topten_picture_9_updated_at
  end
end
