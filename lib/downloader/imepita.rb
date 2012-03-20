# -*- coding: utf-8 -*-
class Downloader::Imepita < Downloader::Base
  def images
    raise if body.to_s =~ /画像が削除されているか/
  end
end
