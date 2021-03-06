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

ActiveRecord::Schema.define(:version => 20130624162724) do

  create_table "basic_profiles", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "headline"
    t.string   "industry"
    t.string   "location"
    t.string   "specialities"
    t.string   "summary"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
  end

  create_table "connections", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "industry"
    t.string   "headline"
    t.string   "country"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "user_id"
    t.integer  "connection_id"
    t.string   "uniquness_number"
    t.datetime "last_communication_date"
    t.datetime "current_date"
    t.string   "picture_url"
  end

  create_table "skills", :force => true do |t|
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "update_events", :force => true do |t|
    t.string   "content"
    t.time     "stamp"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "connection_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
