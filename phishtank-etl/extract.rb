require 'byebug'
require 'http'

class Extractor
    def initialize(domain, path)
        @uri = "https://#{domain}/#{path}"
    end

    def extract
        res = self.fetch @uri
        byebug
        if res == nil
          puts "Tolis"
        end
    end

    private
    def fetch(uri_str, limit = 10)
      raise 'Too many HTTP redirects' if limit == 0

      temp = Tempfile.new("phishtank_temp_stream_")
      res = HTTP.get(uri_str)
      byebug
      if res.status.ok?
        res.body.each do |chunk|
          byebug
          temp.write(chunk)
        end
      elsif res.status.redirect?
        byebug
        location = res.headers['Location']
        fetch(location, limit - 1)
      else
        raise "Status Code #{res.code} not handled"
      end
      temp
    end
end
