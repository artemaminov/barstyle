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

ActiveRecord::Schema.define(:version => 20121130142818) do

  create_table "active_admin_comments", :force => true do |t|
    t.string    "resource_id",                :null => false
    t.string    "resource_type",              :null => false
    t.integer   "author_id"
    t.string    "author_type"
    t.text      "body"
    t.timestamp "created_at",    :limit => 6, :null => false
    t.timestamp "updated_at",    :limit => 6, :null => false
    t.string    "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string    "email",                               :default => "", :null => false
    t.string    "encrypted_password",                  :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at", :limit => 6
    t.timestamp "remember_created_at",    :limit => 6
    t.integer   "sign_in_count",                       :default => 0
    t.timestamp "current_sign_in_at",     :limit => 6
    t.timestamp "last_sign_in_at",        :limit => 6
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "created_at",             :limit => 6,                 :null => false
    t.timestamp "updated_at",             :limit => 6,                 :null => false
    t.string    "role"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "pages", :force => true do |t|
    t.string    "title",                            :null => false
    t.string    "featured_image"
    t.text      "announce"
    t.text      "text",                             :null => false
    t.string    "permalink",                        :null => false
    t.boolean   "at_main",                          :null => false
    t.integer   "section_id",                       :null => false
    t.boolean   "is_subsection",                    :null => false
    t.string    "static_attached"
    t.timestamp "created_at",          :limit => 6, :null => false
    t.timestamp "updated_at",          :limit => 6, :null => false
    t.integer   "subsection_position"
  end

  create_table "rich_rich_files", :force => true do |t|
    t.timestamp "created_at",             :limit => 6,                     :null => false
    t.timestamp "updated_at",             :limit => 6,                     :null => false
    t.string    "rich_file_file_name"
    t.string    "rich_file_content_type"
    t.integer   "rich_file_file_size"
    t.timestamp "rich_file_updated_at",   :limit => 6
    t.string    "owner_type"
    t.integer   "owner_id"
    t.text      "uri_cache"
    t.string    "simplified_type",                     :default => "file"
  end

  create_table "sections", :force => true do |t|
    t.string    "name",                         :null => false
    t.string    "permalink"
    t.integer   "position"
    t.boolean   "show_in_menu",                 :null => false
    t.boolean   "is_news_section",              :null => false
    t.timestamp "created_at",      :limit => 6, :null => false
    t.timestamp "updated_at",      :limit => 6, :null => false
  end

end
