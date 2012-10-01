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

ActiveRecord::Schema.define(:version => 20121001163450) do

  create_table "active_admin_comments", :force => true do |t|
    t.text    "resource_id",   :limit => 255, :null => false
    t.text    "resource_type", :limit => 255, :null => false
    t.integer "author_id"
    t.text    "author_type",   :limit => 255
    t.text    "body"
    t.text    "created_at",    :limit => 6,   :null => false
    t.text    "updated_at",    :limit => 6,   :null => false
    t.text    "namespace",     :limit => 255
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.text    "email",                  :limit => 255, :null => false
    t.text    "encrypted_password",     :limit => 255, :null => false
    t.text    "reset_password_token",   :limit => 255
    t.text    "reset_password_sent_at", :limit => 6
    t.text    "remember_created_at",    :limit => 6
    t.integer "sign_in_count"
    t.text    "current_sign_in_at",     :limit => 6
    t.text    "last_sign_in_at",        :limit => 6
    t.text    "current_sign_in_ip",     :limit => 255
    t.text    "last_sign_in_ip",        :limit => 255
    t.text    "created_at",             :limit => 6,   :null => false
    t.text    "updated_at",             :limit => 6,   :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "menus", :force => true do |t|
    t.text    "name",       :limit => 255
    t.text    "permalink",  :limit => 255
    t.integer "position"
    t.text    "created_at", :limit => 6,   :null => false
    t.text    "updated_at", :limit => 6,   :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.string   "permalink"
    t.boolean  "main"
    t.integer  "menu_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rich_rich_files", :force => true do |t|
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "rich_file_file_name"
    t.string   "rich_file_content_type"
    t.integer  "rich_file_file_size"
    t.datetime "rich_file_updated_at"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.text     "uri_cache"
    t.string   "simplified_type",        :default => "file"
  end

end
