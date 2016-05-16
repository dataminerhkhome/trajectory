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

ActiveRecord::Schema.define(version: 20160503211932) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "positions", force: true do |t|
    t.integer  "stroke_id"
    t.float    "distance"
    t.float    "height"
    t.integer  "flight_time"
    t.float    "x_speed"
    t.float    "y_speed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "positions", ["stroke_id"], name: "index_positions_on_stroke_id", using: :btree

  create_table "strokes", force: true do |t|
    t.integer  "velocity"
    t.integer  "angle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "height"
    t.float    "rise_time"
  end

end
