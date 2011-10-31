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

ActiveRecord::Schema.define(:version => 20110913185427) do

  create_table "activities", :force => true do |t|
    t.string   "title"
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean  "all_day",          :default => false
    t.integer  "activity_type_id"
    t.string   "correlation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_path"
  end

  create_table "debts", :force => true do |t|
    t.integer  "expensee_user_id"
    t.integer  "user_id"
    t.integer  "expense_id"
    t.integer  "sum"
    t.boolean  "paid",             :default => false
    t.boolean  "payment_approved", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean  "all_day",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expenses", :force => true do |t|
    t.integer  "user_id"
    t.string   "description"
    t.datetime "date"
    t.boolean  "paid_in_full", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name",              :limit => 40
    t.string   "authorizable_type", :limit => 40
    t.string   "authorizable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rvsp_statuses", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rvsps", :force => true do |t|
    t.integer  "activity_id"
    t.integer  "user_id"
    t.integer  "rvsp_status_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "personal_number"
    t.string   "street_address"
    t.string   "zip_code"
    t.string   "living_area"
    t.boolean  "active"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.text     "goals"
    t.boolean  "wants_reminders"
    t.integer  "reminder_time"
    t.string   "player_type_id"
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved",           :default => false
  end

  create_table "wall_posts", :force => true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
