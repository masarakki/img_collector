require 'spec_helper'
require 'downloader'

describe Downloader::Atpita do
  subject { @downloader }
  before { @downloader = Downloader::Atpita.new('') }

  context :ok do
    before do
      pending
    end
    its(:images) { should_not == [] }
  end

  context :expired do
    before do
      pending
    end
    its(:images) { should == [] }
  end
end
