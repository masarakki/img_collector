class BoardThread < ActiveRecord::Base
  [:title, :hostname, :board_key, :thread_key].each do |key|
    validates key, presence: true
  end
  validates :thread_key, :uniqueness => {:scope => [:hostname, :board_key]}

  def dat_file
    "http://#{hostname}/#{board_key}/dat/#{thread_key}.dat"
  end

  def url=(url)
    matched = url.match /http:\/\/(\w.+)\/test\/read.cgi\/(\w+)\/(\d+)\//
    self.hostname = matched[1]
    self.board_key = matched[2]
    self.thread_key = matched[3]
  end

  def url
    "http://#{hostname}/#{board_key}/#{thread_key}" if hostname.present? and board_key.present? and thread_key.present?
  end
end
