class BoardThread < ActiveRecord::Base
  [:title, :hostname, :board_key, :thread_key].each do |key|
    validates key, presence: true
  end
  validates :thread_key, :uniqueness => {:scope => [:hostname, :board_key]}

  def dat_file
    "http://#{hostname}/#{board_key}/dat/#{thread_key}.dat"
  end
end
