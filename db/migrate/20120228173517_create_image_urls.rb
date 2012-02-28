class CreateImageUrls < ActiveRecord::Migration
  def change
    create_table :image_urls do |t|
      t.integer :board_thread_id, :null => false
      t.string :url, :nil => false
      t.string :uploader_type, :null => false
      t.boolean :finished, :default => false
      t.string :writer
      t.string :body
      t.datetime :accessed_at
      t.timestamps
    end
    add_index :image_urls, :board_thread_id
    add_index :image_urls, :finished
    add_index :image_urls, [:uploader_type, :finished]
  end

end
