class CreateSiteconfigs < ActiveRecord::Migration
  def self.up
    create_table :siteconfigs do |t|
      t.string :hero_url
      t.string :sidekick_url_1
      t.string :sidekick_url_2
      t.string :sidekick_url_3

      t.timestamps
    end
  end

  def self.down
    drop_table :siteconfigs
  end
end
