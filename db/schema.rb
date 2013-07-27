# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130727123550) do

  create_table "friends", :force => true do |t|
    t.integer  "uid1"
    t.integer  "uid2"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "friends", ["uid1", "uid2"], :name => "index_friends_on_uid1_and_uid2", :unique => true

  create_table "photos", :force => true do |t|
    t.string   "lat"
    t.string   "lng"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.string   "city"
  end

  add_index "photos", ["user_id"], :name => "index_photos_on_user_id"

  create_table "requests", :force => true do |t|
    t.integer  "uid"
    t.string   "fid"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "thumbnail"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "rrid"
    t.string   "wbid"
    t.string   "sessionKey"
    t.string   "token"
  end

end
