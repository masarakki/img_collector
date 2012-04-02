require 'spec_helper'

describe Board do
  subject { @board }
  describe :init do
    before do
      @board_threads = FactoryGirl.create_list(:board_thread, 3)
      @board_thread = @board_threads.first
      @board = Board.new(host: @board_thread.hostname,  board: @board_thread.board_key)
    end
    its(:host) { should == @board_thread.hostname }
    its(:board) { should == @board_thread.board_key }
    its(:board_threads) { should == @board_threads }
  end
  describe :reload! do

  end
end
