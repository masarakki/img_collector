# -*- coding: utf-8 -*-
require 'spec_helper'

describe ImageUrl do
  before do
    @attributes = {
      :board_thread_id => 1,
      :url => 'http://imepic.jp/20120226/764220',
      :body => 'http://imepic.jp/20120226/764220 <br> <br> 貼れてる?(/ _ ; )',
      :writer => '名無し',
      :uploader_type => 'imepic',
      :accessed_at => nil,
      :finished => false
    }
  end

  describe :new do
    subject { ImageUrl.new(@attributes) }
    it { should be_valid }
  end
end
