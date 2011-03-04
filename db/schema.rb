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

ActiveRecord::Schema.define(:version => 20110304201538) do

  create_table "activities", :force => true do |t|
    t.datetime "start_time"
    t.integer  "duration"
    t.boolean  "all_day"
    t.string   "type"
    t.string   "correlation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "personal_number"
    t.string   "street_address"
    t.string   "zip_code"
    t.string   "living_area"
    t.boolean  "active"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.string   "email"
    t.text     "goals"
    t.boolean  "wants_reminders"
    t.integer  "reminder_time"
    t.string   "player_type_id"
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
    t.integer  "player_id"
    t.integer  "rvsp_status_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
