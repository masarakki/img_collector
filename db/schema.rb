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

ActiveRecord::Schema.define(:version => 20111001205939) do

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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "board_threads", ["accessed_at"], :name => "index_board_threads_on_accessed_at"
  add_index "board_threads", ["hostname", "board_key", "thread_key"], :name => "thread_index", :unique => true

end
