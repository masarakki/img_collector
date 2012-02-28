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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120228173517) do

  create_table "board_threads", :force => true do |t|
    t.string   "title",                            :null => false
    t.string   "hostname",                         :null => false
    t.string   "board_key",                        :null => false
    t.string   "thread_key",                       :null => false
    t.boolean  "finished",      :default => false
    t.integer  "dat_size",      :default => 0
    t.integer  "res_num",       :default => 0
    t.integer  "new_res",       :default => 0
    t.string   "last_modified", :default => ""
    t.datetime "accessed_at"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "board_threads", ["accessed_at"], :name => "index_board_threads_on_accessed_at"
  add_index "board_threads", ["hostname", "board_key", "thread_key"], :name => "thread_index", :unique => true

  create_table "image_urls", :force => true do |t|
    t.integer  "board_thread_id",                    :null => false
    t.string   "url"
    t.string   "uploader_type",                      :null => false
    t.boolean  "finished",        :default => false
    t.string   "writer"
    t.string   "body"
    t.datetime "accessed_at"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "image_urls", ["board_thread_id"], :name => "index_image_urls_on_board_thread_id"
  add_index "image_urls", ["finished"], :name => "index_image_urls_on_finished"
  add_index "image_urls", ["uploader_type", "finished"], :name => "index_image_urls_on_uploader_type_and_finished"

end
