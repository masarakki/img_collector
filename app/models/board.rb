class Board
  attr_accessor :host, :board
  def initialize(attributes)
    attributes.each_pair do |key, value|
      send("#{key}=", value)
    end
  end

  def board_threads
    BoardThread.where(hostname: host, board_key: board)
  end

  def reload!
    updates = mona_board.threads
    threads = board_threads
    BoardThread.transaction do
      updates.each do |update|

      end
    end
  end

  private
  def mona_board
    @mona_board ||= Mona::Board.new(host, board)
  end
end
