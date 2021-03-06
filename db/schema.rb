# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110516114636) do

  create_table "siteconfigs", :force => true do |t|
    t.string   "hero_title_1"
    t.string   "hero_desc_1"
    t.string   "hero_link_1"
    t.string   "hero_title_2"
    t.string   "hero_desc_2"
    t.string   "hero_link_2"
    t.string   "hero_title_3"
    t.string   "hero_desc_3"
    t.string   "hero_link_3"
    t.string   "topten_title_1"
    t.string   "topten_link_1"
    t.string   "topten_title_2"
    t.string   "topten_link_2"
    t.string   "topten_title_3"
    t.string   "topten_title_4"
    t.string   "topten_link_4"
    t.string   "topten_title_5"
    t.string   "topten_link_5"
    t.string   "topten_title_6"
    t.string   "topten_link_6"
    t.string   "topten_title_7"
    t.string   "topten_link_7"
    t.string   "topten_title_8"
    t.string   "topten_link_8"
    t.string   "topten_title_9"
    t.string   "topten_link_9"
    t.string   "topten_title_10"
    t.string   "topten_link_10"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hero_picture_big_1_file_name"
    t.string   "hero_picture_big_1_content_type"
    t.integer  "hero_picture_big_1_file_size"
    t.datetime "hero_picture_big_1_updated_at"
    t.string   "hero_picture_small_1_file_name"
    t.string   "hero_picture_small_1_content_type"
    t.integer  "hero_picture_small_1_file_size"
    t.datetime "hero_picture_small_1_updated_at"
    t.string   "hero_picture_big_2_file_name"
    t.string   "hero_picture_big_2_content_type"
    t.integer  "hero_picture_big_2_file_size"
    t.datetime "hero_picture_big_2_updated_at"
    t.string   "hero_picture_small_2_file_name"
    t.string   "hero_picture_small_2_content_type"
    t.integer  "hero_picture_small_2_file_size"
    t.datetime "hero_picture_small_2_updated_at"
    t.string   "hero_picture_big_3_file_name"
    t.string   "hero_picture_big_3_content_type"
    t.integer  "hero_picture_big_3_file_size"
    t.datetime "hero_picture_big_3_updated_at"
    t.string   "hero_picture_small_3_file_name"
    t.string   "hero_picture_small_3_content_type"
    t.integer  "hero_picture_small_3_file_size"
    t.datetime "hero_picture_small_3_updated_at"
    t.string   "topten_picture_1_file_name"
    t.string   "topten_picture_1_content_type"
    t.integer  "topten_picture_1_file_size"
    t.datetime "topten_picture_1_updated_at"
    t.string   "topten_picture_2_file_name"
    t.string   "topten_picture_2_content_type"
    t.integer  "topten_picture_2_file_size"
    t.datetime "topten_picture_2_updated_at"
    t.string   "topten_picture_3_file_name"
    t.string   "topten_picture_3_content_type"
    t.integer  "topten_picture_3_file_size"
    t.datetime "topten_picture_3_updated_at"
    t.string   "topten_picture_4_file_name"
    t.string   "topten_picture_4_content_type"
    t.integer  "topten_picture_4_file_size"
    t.datetime "topten_picture_4_updated_at"
    t.string   "topten_picture_5_file_name"
    t.string   "topten_picture_5_content_type"
    t.integer  "topten_picture_5_file_size"
    t.datetime "topten_picture_5_updated_at"
    t.string   "topten_picture_6_file_name"
    t.string   "topten_picture_6_content_type"
    t.integer  "topten_picture_6_file_size"
    t.datetime "topten_picture_6_updated_at"
    t.string   "topten_picture_7_file_name"
    t.string   "topten_picture_7_content_type"
    t.integer  "topten_picture_7_file_size"
    t.datetime "topten_picture_7_updated_at"
    t.string   "topten_picture_8_file_name"
    t.string   "topten_picture_8_content_type"
    t.integer  "topten_picture_8_file_size"
    t.datetime "topten_picture_8_updated_at"
    t.string   "topten_picture_9_file_name"
    t.string   "topten_picture_9_content_type"
    t.integer  "topten_picture_9_file_size"
    t.datetime "topten_picture_9_updated_at"
    t.string   "topten_picture_10_file_name"
    t.string   "topten_picture_10_content_type"
    t.integer  "topten_picture_10_file_size"
    t.datetime "topten_picture_10_updated_at"
    t.string   "topten_link_3"
  end

  create_table "sproduct_variants", :force => true do |t|
    t.integer  "sproduct_id"
    t.string   "sku"
    t.string   "size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "compare_to_price"
    t.decimal  "price",            :precision => 8, :scale => 2
  end

  create_table "sproducts", :force => true do |t|
    t.string   "product_type"
    t.string   "product_category"
    t.string   "title"
    t.text     "body_html"
    t.string   "color"
    t.string   "gender"
    t.string   "brand"
    t.string   "onsale"
    t.string   "collectible"
    t.string   "custom"
    t.string   "vendor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shopify_product_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "featured"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "roles"
    t.string   "shopify_product_vendor"
  end

end
