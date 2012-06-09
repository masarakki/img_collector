class ImageUrl < ActiveRecord::Base
  attr_accessible :board_thread_id, :writer, :body, :url
  [:board_thread_id, :writer, :body, :url].each do |key|
    validates key, presence: true
  end
  belongs_to :board_thread
end
