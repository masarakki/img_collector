class Downloader::Picto < Downloader::Base
  def images
    body.xpath('//img').map do |x|
      src = x['src']
      URI.join('http://' + url.host, src).to_s unless src =~ /http/
    end
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
    m.perform
    responses
  end
end
