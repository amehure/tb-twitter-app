# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_13_070740) do

  create_table "ddays", force: :cascade do |t|
    t.string "event_no"
    t.string "event_sub_no"
    t.datetime "event_date"
    t.string "decision"
    t.integer "max_num"
    t.string "zoom_url"
    t.string "zoom_id"
    t.string "zoom_pass"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "event_id"
    t.index ["event_id"], name: "index_ddays_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "event_name"
    t.text "contents"
    t.integer "days_held"
    t.string "organizar"
    t.datetime "deadline"
    t.boolean "multiple_entries"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "event_no"
  end

  create_table "users", force: :cascade do |t|
    t.string "event_no"
    t.string "event_sub_no"
    t.string "serial_no"
    t.string "twitter_screenname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "dday_id"
    t.index ["dday_id"], name: "index_users_on_dday_id"
  end

  add_foreign_key "ddays", "events"
  add_foreign_key "users", "ddays"
end
