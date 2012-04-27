# -*- coding: utf-8 -*-
require 'spec_helper'

describe ImageUrl do
  subject { @image_url }
  describe :new do
    before { @image_url = FactoryGirl.build(:image_url) }
    it { should be_valid }
  end
end
