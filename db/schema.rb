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
    t.string "event_no", null: false
    t.string "event_sub_no", null: false
    t.datetime "event_date", null: false
    t.string "decision", null: false
    t.integer "max_num", null: false
    t.string "zoom_url"
    t.string "zoom_id"
    t.string "zoom_pass"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "event_id", null: false
    t.index ["event_id"], name: "index_ddays_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "event_name", null: false
    t.text "contents", null: false
    t.integer "days_held", null: false
    t.string "organizar", null: false
    t.datetime "deadline", null: false
    t.boolean "multiple_entries", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "event_no", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "event_no", null: false
    t.string "event_sub_no", null: false
    t.string "serial_no", null: false
    t.string "twitter_screenname", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "dday_id", null: false
    t.index ["dday_id"], name: "index_users_on_dday_id"
  end

  add_foreign_key "ddays", "events"
  add_foreign_key "users", "ddays"
end
