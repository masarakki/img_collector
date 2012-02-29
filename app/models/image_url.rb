class ImageUrl < ActiveRecord::Base
  [:board_thread_id, :writer, :body, :url].each do |key|
    validates key, presence: true
  end
end
