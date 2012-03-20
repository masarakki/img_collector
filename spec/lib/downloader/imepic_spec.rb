require 'spec_helper'
require 'downloader'

describe Downloader::Imepic do
  subject { @downloader }
  before { @downloader = Downloader::Imepic.new('http://imepic.jp/20120206/348430') }
  context :ok do
    before do
      pending
    end
    its(:images) { should == ['http://img1.imepic.jp/image/20120206/348430.jpg?82262b83db7d18e950305ee623e7cd39'] }
  end

  context :no_contnet do
    before do
      @downloader.stub(:body).and_return(nokogiri('imepic', 'no_content.html'))
    end
    its(:images) { should == [] }
  end
end
