class ImageUrl < ActiveRecord::Base
  [:board_thread_id, :writer, :body, :url].each do |key|
    validates key, presence: true
  end
  belongs_to :board_thread
end
