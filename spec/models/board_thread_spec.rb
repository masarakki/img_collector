require 'spec_helper'

describe BoardThread do
  subject { @thread }
  let(:url) { "http://kilauea.bbspink.com/test/read.cgi/megami/1330282190/" }
  context :initialize do
    before do
      @thread = FactoryGirl.build(:board_thread, :thread_key => 1000000 )
    end

    its(:valid?) { should be_true }
    its(:dat_file) { should eq('http://kilauea.bbspink.com/megami/dat/1000000.dat') }

    context :not_unique do
      before { BoardThread.new(@thread.attributes).save }
      its(:valid?) { should be_false }
    end
  end

  describe :accessible do
    before do
      @thread = FactoryGirl.create(:board_thread)
    end
  end

  describe :instance_methods do
    describe :url= do
      before do
        @thread = BoardThread.new
        @thread.url = url
      end

      its(:hostname) { should == 'kilauea.bbspink.com' }
      its(:board_key) { should == 'megami' }
      its(:thread_key) { should == 1330282190 }
    end

    describe :new_response! do
    end
  end

  describe :class_methods do
    describe :create_from_url do
      before { @thread = BoardThread.create_from_url(url) }
    end
  end
end
