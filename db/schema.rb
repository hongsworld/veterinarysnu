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

ActiveRecord::Schema.define(version: 20160313204029) do

  create_table "neodins", force: :cascade do |t|
    t.datetime "in_date"
    t.datetime "out_date"
    t.string   "hospital"
    t.string   "patient_name"
    t.string   "species"
    t.string   "breeds"
    t.string   "sex"
    t.string   "age"
    t.string   "site"
    t.string   "macro"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
