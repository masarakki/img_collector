require 'uri'
class Downloader::Base
  attr_accessor :url, :cookie

  def initialize(url, options = nil)
    self.url = URI.parse(url)
  end

  def body
    unless @body
      response = Curl::Easy.perform(url.to_s) do |c|
        c.headers = headers
        c.enable_cookies = true
      end
      @cookies = response.cookies
      @body = Nokogiri::HTML(response.body_str.toutf8)
    end
    @body
  end

  def cookies
    unless @cookies
      body
    end
    @cookies
  end

  def headers(options = nil)
    {
      'Accept-Encoding' => 'gzip,deflate',
      'Accept' => 'image/png,*/*;q=0.5',
      'Accept-Language' => 'ja,en-us;q=0.7,en;q=0.3',
      'Accept-Charset' => 'Shift-JIS,utf-8;q=0.7,*;q=0.7',
      'Connection' => 'keep-alive',
      'Keep-Alive' => '300',
      'User-Agent' => 'Mozilla/5.0 (Windows; U; Windows NT 6.0; ja; rv:1.8.1.10) Gecko/20071115 Firefox/2.0.0.10'
    }.merge(options || {})
  end
end
