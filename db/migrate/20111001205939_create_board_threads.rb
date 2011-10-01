class CreateBoardThreads < ActiveRecord::Migration
  def change
    create_table :board_threads do |t|
      t.string :title, null: false
      t.string :hostname, null: false
      t.string :board_key, null: false
      t.string :thread_key, null: false
      t.boolean :finished, default: false
      t.integer :dat_size, default: 0
      t.integer :res_num, default: 0
      t.integer :new_res, default: 0
      t.string :last_modified, default: ''
      t.datetime :accessed_at, default: ''
      t.timestamps
    end
    add_index :board_threads, [:hostname, :board_key, :thread_key], :unique => true, :name => 'thread_index'
    add_index :board_threads, :accessed_at
  end
end
