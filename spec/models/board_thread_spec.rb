require 'spec_helper'

describe BoardThread do
  subject { @thread }

  before(:all) do
    @thread = FactoryGirl.build(:board_thread, :thread_key => 1000000 )
  end

  its(:valid?) { should be_true }
  its(:dat_file) { should eq('http://kilauea.bbspink.com/megami/dat/1000000.dat') }

  context :not_unique do
    before { BoardThread.new(@thread.attributes).save }
    its(:valid?) { should be_false }
  end

  describe :url= do
    before do
      @thread = BoardThread.new
      @thread.url = "http://kilauea.bbspink.com/test/read.cgi/megami/1330282190/"
    end

    its(:hostname) { should == 'kilauea.bbspink.com' }
    its(:board_key) { should == 'megami' }
    its(:thread_key) { should == 1330282190 }
  end
end
