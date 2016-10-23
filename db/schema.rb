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

ActiveRecord::Schema.define(version: 20161023034201) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "message_recipients", force: :cascade do |t|
    t.integer  "message_id"
    t.integer  "user_id"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "sender_id"
    t.index ["message_id"], name: "index_message_recipients_on_message_id", using: :btree
    t.index ["user_id"], name: "index_message_recipients_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string   "message_type"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "title"
    t.integer  "recipient_id"
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.integer  "relationship_status"
    t.integer  "action"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["user_id"], name: "index_relationships_on_user_id", using: :btree
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
    t.index ["updated_at"], name: "index_sessions_on_updated_at", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

  add_foreign_key "message_recipients", "messages"
  add_foreign_key "message_recipients", "users"
  add_foreign_key "messages", "users"
  add_foreign_key "relationships", "users"
end
