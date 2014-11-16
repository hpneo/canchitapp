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

ActiveRecord::Schema.define(version: 20141116190715) do

  create_table "checkins", force: true do |t|
    t.integer  "movie_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "checkins", ["movie_id"], name: "index_checkins_on_movie_id", using: :btree
  add_index "checkins", ["user_id"], name: "index_checkins_on_user_id", using: :btree

  create_table "movies", force: true do |t|
    t.string   "title"
    t.string   "poster_path"
    t.string   "year"
    t.string   "api_id"
    t.text     "overview"
    t.string   "director"
    t.text     "cast"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "facebook_uid"
    t.string   "facebook_token"
    t.string   "facebook_secret"
    t.string   "twitter_uid"
    t.string   "twitter_token"
    t.string   "twitter_secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
