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

ActiveRecord::Schema.define(version: 20150420153318) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.integer  "year"
    t.text     "detail"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "stage"
    t.integer  "investor_id"
    t.integer  "field_id"
  end

  add_index "companies", ["field_id"], name: "index_companies_on_field_id"
  add_index "companies", ["investor_id"], name: "index_companies_on_investor_id"

  create_table "company_fields", force: :cascade do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "company_fields", ["company_id"], name: "index_company_fields_on_company_id"

  create_table "founders", force: :cascade do |t|
    t.string   "name"
    t.text     "background"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "category"
  end

  create_table "investors", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.string   "location"
    t.string   "field"
    t.text     "detail"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "level"
  end

  add_index "investors", ["company_id"], name: "index_investors_on_company_id"

end
