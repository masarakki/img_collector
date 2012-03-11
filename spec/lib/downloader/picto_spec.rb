require 'spec_helper'
require 'downloader'

describe Downloader::Picto do
  subject { @downloader }
  before { @downloader = Downloader::Picto.new("http://j.pic.to/2wqvw") }
  its(:images) { should == ['http://j.pic.to/2wqvw-1-8b10.jpg'] }
  its("get_images.keys") { should == ["http://j.pic.to/2wqvw-1-8b10.jpg"]}
end
