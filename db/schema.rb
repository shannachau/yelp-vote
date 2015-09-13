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

ActiveRecord::Schema.define(version: 20150913233040) do

  create_table "entries", force: :cascade do |t|
    t.string   "text"
    t.integer  "user_id",                             null: false
    t.integer  "message_id",                          null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "has_yelp_suggestion", default: false
  end

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages_users", id: false, force: :cascade do |t|
    t.integer "user_id",    null: false
    t.integer "message_id", null: false
  end

  add_index "messages_users", ["message_id", "user_id"], name: "index_messages_users_on_message_id_and_user_id"
  add_index "messages_users", ["user_id", "message_id"], name: "index_messages_users_on_user_id_and_message_id"

  create_table "polls", force: :cascade do |t|
    t.integer  "yes",        default: 0
    t.integer  "no",         default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "yelp_suggestions", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "image_url"
    t.string   "rating_image"
    t.string   "location"
    t.integer  "entry_id",     null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
