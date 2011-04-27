class AddAttachmentHeroPictureSidekickPicture1SidekickPicture2SidekickPicture3ToSiteconfig < ActiveRecord::Migration
  def self.up
    add_column :siteconfigs, :hero_picture_file_name, :string
    add_column :siteconfigs, :hero_picture_content_type, :string
    add_column :siteconfigs, :hero_picture_file_size, :integer
    add_column :siteconfigs, :hero_picture_updated_at, :datetime
    add_column :siteconfigs, :sidekick_picture_1_file_name, :string
    add_column :siteconfigs, :sidekick_picture_1_content_type, :string
    add_column :siteconfigs, :sidekick_picture_1_file_size, :integer
    add_column :siteconfigs, :sidekick_picture_1_updated_at, :datetime
    add_column :siteconfigs, :sidekick_picture_2_file_name, :string
    add_column :siteconfigs, :sidekick_picture_2_content_type, :string
    add_column :siteconfigs, :sidekick_picture_2_file_size, :integer
    add_column :siteconfigs, :sidekick_picture_2_updated_at, :datetime
    add_column :siteconfigs, :sidekick_picture_3_file_name, :string
    add_column :siteconfigs, :sidekick_picture_3_content_type, :string
    add_column :siteconfigs, :sidekick_picture_3_file_size, :integer
    add_column :siteconfigs, :sidekick_picture_3_updated_at, :datetime
  end

  def self.down
    remove_column :siteconfigs, :hero_picture_file_name
    remove_column :siteconfigs, :hero_picture_content_type
    remove_column :siteconfigs, :hero_picture_file_size
    remove_column :siteconfigs, :hero_picture_updated_at
    remove_column :siteconfigs, :sidekick_picture_1_file_name
    remove_column :siteconfigs, :sidekick_picture_1_content_type
    remove_column :siteconfigs, :sidekick_picture_1_file_size
    remove_column :siteconfigs, :sidekick_picture_1_updated_at
    remove_column :siteconfigs, :sidekick_picture_2_file_name
    remove_column :siteconfigs, :sidekick_picture_2_content_type
    remove_column :siteconfigs, :sidekick_picture_2_file_size
    remove_column :siteconfigs, :sidekick_picture_2_updated_at
    remove_column :siteconfigs, :sidekick_picture_3_file_name
    remove_column :siteconfigs, :sidekick_picture_3_content_type
    remove_column :siteconfigs, :sidekick_picture_3_file_size
    remove_column :siteconfigs, :sidekick_picture_3_updated_at
  end
end
