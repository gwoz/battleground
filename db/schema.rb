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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160423194916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "battles", force: :cascade do |t|
    t.integer "winner"
    t.integer "task_id"
  end

  create_table "battles_users", force: :cascade do |t|
    t.integer "battle_id"
    t.integer "user_id"
  end

  create_table "geolocations", force: :cascade do |t|
    t.integer   "user_id"
    t.float     "speed"
    t.geography "lonlat",              limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.float     "accuracy"
    t.float     "heading"
    t.float     "altitude"
    t.float     "altitude_accuracy"
    t.boolean   "is_heartbeat"
    t.boolean   "sample"
    t.boolean   "is_moving"
    t.float     "odometer"
    t.string    "uuid"
    t.string    "activity_type"
    t.float     "activity_confidence"
    t.float     "battery_level"
    t.boolean   "battery_is_charging"
    t.string    "app_timestamp"
    t.datetime  "created_at",                                                                   null: false
    t.datetime  "updated_at",                                                                   null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title",       null: false
    t.string "description"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_battles", force: :cascade do |t|
    t.integer "battle_id", null: false
    t.integer "user_id",   null: false
  end

  add_index "users_battles", ["battle_id"], name: "index_users_battles_on_battle_id", using: :btree
  add_index "users_battles", ["user_id"], name: "index_users_battles_on_user_id", using: :btree

end
