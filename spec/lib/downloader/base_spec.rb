require 'spec_helper'
require 'downloader'

describe Downloader::Base do
  subject { @downloader }
  before { @downloader = Downloader::Base.new('http://localhost/xyzxyz') }
  its(:url) { should == URI.parse('http://localhost/xyzxyz') }
  context :real do
    before { @downloader = Downloader::Base.new('http://imepic.jp/20120206/348430') }
    its(:body) { should be_a Nokogiri::HTML::Document }
  end
end
