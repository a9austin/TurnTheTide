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

ActiveRecord::Schema.define(:version => 20140323185843) do

  create_table "air_qualities", :force => true do |t|
    t.string   "category"
    t.integer  "action"
    t.integer  "number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "discussion"
    t.string   "message"
  end

  create_table "feeds", :force => true do |t|
    t.string   "username"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "karmas", :force => true do |t|
    t.decimal  "points",     :precision => 10, :scale => 4
    t.integer  "rank"
    t.integer  "user_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "level_id"
  end

  create_table "levels", :force => true do |t|
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "current_level_points"
    t.integer  "next_level_points"
    t.string   "label"
    t.string   "filename"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "rank"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "totals", :force => true do |t|
    t.integer  "user_id"
    t.integer  "total_trips"
    t.decimal  "total_miles",       :precision => 10, :scale => 4
    t.integer  "total_walk_trips"
    t.decimal  "total_walk_miles",  :precision => 10, :scale => 4
    t.integer  "total_bike_trips"
    t.decimal  "total_bike_miles",  :precision => 10, :scale => 4
    t.integer  "total_bus_trips"
    t.decimal  "total_bus_miles",   :precision => 10, :scale => 0
    t.integer  "total_train_trips"
    t.decimal  "total_train_miles", :precision => 10, :scale => 4
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.integer  "total_car_miles"
    t.integer  "total_car_trips"
  end

  create_table "trips", :force => true do |t|
    t.datetime "date"
    t.decimal  "walk_miles",  :precision => 10, :scale => 4
    t.integer  "user_id"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.decimal  "bike_miles",  :precision => 10, :scale => 4
    t.decimal  "train_miles", :precision => 10, :scale => 4
    t.decimal  "bus_miles",   :precision => 10, :scale => 4
    t.integer  "car_miles"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "team_id"
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
