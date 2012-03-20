require 'spec_helper'
require 'downloader'

describe Downloader::Picto do
  subject { @downloader }
  before { @downloader = Downloader::Picto.new("http://j.pic.to/2wqvw") }
  context :ok do
    before do
      @downloader.stub(:body).and_return(nokogiri('picto', 'ok.html'))
    end
    its(:images) { should == ['http://j.pic.to/2wqvw-1-89cb.jpg'] }
  end
  context :expired do
    before do
      pending
    end
    its(:images) { should == [] }
  end
end
