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

ActiveRecord::Schema.define(:version => 20110503190618) do

  create_table "histories", :force => true do |t|
    t.string   "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "histories", ["item", "table", "month", "year"], :name => "index_histories_on_item_and_table_and_month_and_year"

  create_table "prelaunch_signups", :force => true do |t|
    t.string   "email"
    t.boolean  "winery"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasting_rooms", :force => true do |t|
    t.integer  "winery_id"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hours"
    t.string   "phone"
    t.string   "tasting_fee"
  end

  create_table "twitter_feeds", :force => true do |t|
    t.string   "screen_name"
    t.string   "auth_token"
    t.string   "auth_secret"
    t.integer  "winery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                :default => false
    t.string   "encrypted_password"
    t.string   "password_salt"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  create_table "varietals", :force => true do |t|
    t.string   "name"
    t.string   "grape"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "varieties", :force => true do |t|
    t.string   "name"
    t.string   "wine_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wine_varietals", :force => true do |t|
    t.integer  "wine_id"
    t.integer  "varietal_id"
    t.integer  "percentage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wine_varieties", :force => true do |t|
    t.integer  "wine_id"
    t.integer  "variety_id"
    t.integer  "percentage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wineries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "background_file_name"
    t.string   "background_content_type"
    t.integer  "background_file_size"
    t.datetime "background_updated_at"
    t.text     "description"
    t.string   "facebook_url"
    t.string   "website_url"
    t.integer  "year_established"
    t.string   "email_address"
  end

  create_table "wines", :force => true do |t|
    t.integer  "winery_id"
    t.integer  "region_id"
    t.integer  "variety_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "label_file_name"
    t.string   "label_content_type"
    t.integer  "label_file_size"
    t.datetime "label_updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "year"
    t.string   "appelation"
    t.text     "notes"
    t.string   "summary_notes"
  end

end
