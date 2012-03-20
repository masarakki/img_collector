class Downloader::Imepic < Downloader::Base
  def images
    body.xpath("//img").map{|x| x['src'] }.select{|x| x.match /.+\.imepic\.jp\/image\/.+/ }
  end

  def get_images
    responses = {}
    m = Curl::Multi.new
    images.each do |image_url|
      responses[image_url] = ""
      c = Curl::Easy.new(image_url) do |curl|
        curl.headers = headers('Referer' => url)
        curl.cookies = cookies
        curl.follow_location = true
        curl.on_body do |data|
          responses[image_url] << data
        end
      end
      m.add(c)
    end
    m.perform do
      puts 'request'
    end
    []
  end
end
