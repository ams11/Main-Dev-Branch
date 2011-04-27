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

ActiveRecord::Schema.define(:version => 20110425120142) do

  create_table "siteconfigs", :force => true do |t|
    t.string   "hero_url"
    t.string   "sidekick_url_1"
    t.string   "sidekick_url_2"
    t.string   "sidekick_url_3"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hero_picture_file_name"
    t.string   "hero_picture_content_type"
    t.integer  "hero_picture_file_size"
    t.datetime "hero_picture_updated_at"
    t.string   "sidekick_picture_1_file_name"
    t.string   "sidekick_picture_1_content_type"
    t.integer  "sidekick_picture_1_file_size"
    t.datetime "sidekick_picture_1_updated_at"
    t.string   "sidekick_picture_2_file_name"
    t.string   "sidekick_picture_2_content_type"
    t.integer  "sidekick_picture_2_file_size"
    t.datetime "sidekick_picture_2_updated_at"
    t.string   "sidekick_picture_3_file_name"
    t.string   "sidekick_picture_3_content_type"
    t.integer  "sidekick_picture_3_file_size"
    t.datetime "sidekick_picture_3_updated_at"
  end

  create_table "sproduct_variants", :force => true do |t|
    t.integer  "sproduct_id"
    t.string   "sku"
    t.decimal  "price"
    t.string   "size"
    t.datetime "created_at"
    t.datetime "updated_at"
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
