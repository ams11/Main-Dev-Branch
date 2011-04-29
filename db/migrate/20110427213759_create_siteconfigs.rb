class CreateSiteconfigs < ActiveRecord::Migration
  def self.up
    create_table :siteconfigs do |t|
      t.string :hero_title_1
      t.string :hero_desc_1
      t.string :hero_link_1
      t.string :hero_title_2
      t.string :hero_desc_2
      t.string :hero_link_2
      t.string :hero_title_3
      t.string :hero_desc_3
      t.string :hero_link_3
      t.string :topten_title_1
      t.string :topten_link_1
      t.string :topten_title_2
      t.string :topten_link_2
      t.string :topten_title_3
      t.string :topten_link_2
      t.string :topten_title_4
      t.string :topten_link_4
      t.string :topten_title_5
      t.string :topten_link_5
      t.string :topten_title_6
      t.string :topten_link_6
      t.string :topten_title_7
      t.string :topten_link_7
      t.string :topten_title_8
      t.string :topten_link_8
      t.string :topten_title_9
      t.string :topten_link_9
      t.string :topten_title_10
      t.string :topten_link_10

      t.timestamps
    end
  end

  def self.down
    drop_table :siteconfigs
  end
end
