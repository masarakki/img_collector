require 'spec_helper'


describe BoardThread do
  before(:all) do
    @attributes = {
      title: 'hoge',
      hostname: 'localhost',
      board_key: 'board_001',
      thread_key: 'thread_001',
      finished: false,
      dat_size: 0,
      accessed_at: Time.now,
      last_modified: 'Hoge',
      res_num: 0,
      new_res: 0
    }
  end
  subject { BoardThread.new @attributes }
  its(:valid?) { should be_true }
  its(:dat_file) { should eq('http://localhost/board_001/dat/thread_001.dat') }

  context :not_unique do
    before { BoardThread.new(@attributes).save }
    its(:valid?) { should be_false }
  end

  describe :url= do
    before do
      @board = BoardThread.new
      @board.url = "http://kilauea.bbspink.com/test/read.cgi/megami/1330282190/"
    end
    subject { @board }

    its(:hostname) { should == 'kilauea.bbspink.com' }
    its(:board_key) { should == 'megami' }
    its(:thread_key) { should == '1330282190' }
  end
end
