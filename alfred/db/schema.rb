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

ActiveRecord::Schema.define(version: 20141201045245) do

  create_table "controls", force: true do |t|
    t.datetime "returned_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "equipment_id"
    t.integer  "user_id"
  end

  add_index "controls", ["equipment_id"], name: "index_controls_on_equipment_id"
  add_index "controls", ["user_id"], name: "index_controls_on_user_id"

  create_table "equipment", force: true do |t|
    t.string   "device_name"
    t.string   "code_name"
    t.boolean  "available"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offices", force: true do |t|
    t.integer  "office_number"
    t.string   "department"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone"
    t.integer  "id_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "office_id"
  end

  add_index "users", ["office_id"], name: "index_users_on_office_id"

end
