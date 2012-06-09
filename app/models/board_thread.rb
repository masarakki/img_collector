class BoardThread < ActiveRecord::Base
  attr_accessible :url

  [:title, :hostname, :board_key, :thread_key].each do |key|
    validates key, presence: true
  end
  validates :thread_key, :uniqueness => {:scope => [:hostname, :board_key]}

  has_many :image_urls

  before_validation :on => :create do
    if !title.present?
      mona_thread.reload
      self.title = mona_thread.title
    end
  end

  def dat_file
    "http://#{hostname}/#{board_key}/dat/#{thread_key}.dat"
  end

  def url=(url)
    @mona_thread = Mona::Thread.from_url(url)
    self.hostname = mona_thread.board.host
    self.board_key = mona_thread.board.board
    self.thread_key = mona_thread.id
  end

  def url
    "http://#{hostname}/test/read.cgi/#{board_key}/#{thread_key}/" if hostname.present? and board_key.present? and thread_key.present?
  end

  private
  def mona_thread
    @mona_thread ||= Mona::Thread.from_url(url)
  end
end
