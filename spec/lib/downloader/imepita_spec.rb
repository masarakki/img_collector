require 'spec_helper'
require 'downloader'

describe Downloader::Imepita do
  subject { @downloader }
  before { @downloader = Downloader::Imepita.new("http://imepita.jp/20071124/590830") }

  context :ok do
    before do
      pending
    end
    its(:images) { should_not == [] }
  end

  context :expired do
    before do
      @downloader.stub(:body).and_return(nokogiri('imepita', 'expired.html'))
    end
    it do
      lambda {
        subject.images
      }.should raise_error
    end
  end
end
