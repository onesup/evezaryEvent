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

ActiveRecord::Schema.define(version: 20140217055335) do

  create_table "access_logs", force: true do |t|
    t.string   "location"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "user_id"
    t.integer  "message_id"
    t.string   "device"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
  end

  add_index "access_logs", ["message_id"], name: "index_access_logs_on_message_id"
  add_index "access_logs", ["user_id"], name: "index_access_logs_on_user_id"

  create_table "gifts", force: true do |t|
    t.string   "title"
    t.string   "code"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.datetime "sent_at"
    t.string   "dest_phone"
    t.string   "send_phone"
    t.string   "send_name"
    t.string   "subject"
    t.text     "msg_body"
    t.string   "image"
    t.integer  "user_id"
    t.integer  "store_id"
    t.string   "cmid"
    t.string   "call_status"
    t.text     "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["store_id"], name: "index_messages_on_store_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "stores", force: true do |t|
    t.string   "title"
    t.string   "phone"
    t.string   "address"
    t.string   "si"
    t.string   "gu"
    t.string   "dong"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "messages_count", default: 0
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "phone"
    t.string   "name"
    t.string   "blog_code"
    t.integer  "viral_score",            default: 0
    t.integer  "gift_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["gift_id"], name: "index_users_on_gift_id"
  add_index "users", ["phone"], name: "index_users_on_phone", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "viral_actions", force: true do |t|
    t.string   "platform"
    t.string   "device"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "viral_actions", ["user_id"], name: "index_viral_actions_on_user_id"

end
