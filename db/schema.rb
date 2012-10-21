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

ActiveRecord::Schema.define(:version => 20121015183529) do

  create_table "meals", :force => true do |t|
    t.string   "name",       :null => false
    t.float    "price",      :null => false
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "meals", ["name"], :name => "index_meals_on_name"

  create_table "menu_items", :force => true do |t|
    t.integer  "restaurant_id",                   :null => false
    t.integer  "meal_id",                         :null => false
    t.date     "date",                            :null => false
    t.integer  "max_reservations"
    t.integer  "cur_reservations", :default => 0
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "menu_items", ["meal_id"], :name => "index_menu_items_on_meal_id"
  add_index "menu_items", ["restaurant_id"], :name => "index_menu_items_on_restaurant_id"

  create_table "reservations", :force => true do |t|
    t.integer  "user_id",      :null => false
    t.integer  "menu_item_id", :null => false
    t.datetime "time_slot"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "reservations", ["menu_item_id"], :name => "index_reservations_on_menu_item_id"
  add_index "reservations", ["user_id"], :name => "index_reservations_on_user_id"

  create_table "restaurants", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "address"
    t.string   "coordinates"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "restaurants", ["name"], :name => "index_restaurants_on_name"

  create_table "users", :force => true do |t|
    t.string   "telephone"
    t.string   "name"
    t.float    "credits",                :default => 0.0, :null => false
    t.string   "email",                  :default => "",  :null => false
    t.string   "encrypted_password",     :default => "",  :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "authentication_token"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
