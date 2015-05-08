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

ActiveRecord::Schema.define(version: 20150508202054) do

  create_table "companies", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "category",    limit: 255
    t.integer  "year",        limit: 4
    t.text     "detail",      limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "stage",       limit: 255
    t.integer  "investor_id", limit: 4
    t.integer  "field_id",    limit: 4
    t.string   "link",        limit: 255
  end

  add_index "companies", ["field_id"], name: "index_companies_on_field_id", using: :btree
  add_index "companies", ["investor_id"], name: "index_companies_on_investor_id", using: :btree

  create_table "company_fields", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "company_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "company_fields", ["company_id"], name: "index_company_fields_on_company_id", using: :btree

  create_table "founders", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "background", limit: 65535
    t.integer  "level",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "category",   limit: 255
  end

  create_table "investors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "category",   limit: 255
    t.string   "location",   limit: 255
    t.string   "field",      limit: 255
    t.text     "detail",     limit: 65535
    t.integer  "company_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "level",      limit: 4
  end

  add_index "investors", ["company_id"], name: "index_investors_on_company_id", using: :btree

  create_table "raw_companies", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "location",   limit: 255
    t.string   "founded",    limit: 255
    t.string   "team",       limit: 255
    t.string   "investor",   limit: 255
    t.string   "field",      limit: 255
    t.string   "buzimodel",  limit: 255
    t.string   "url",        limit: 255
    t.string   "stage",      limit: 255
    t.text     "news",       limit: 65535
    t.string   "source",     limit: 255
    t.text     "desc",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
