require 'byebug'
require 'net/http'

class Extractor
    def initialize(domain, path)
        @domain = domain
        @path = path
    end

    def extract
        res = self.fetch("https://#{@domain}/#{@path}")
        res.body
    end

    private
    def fetch(uri_str, limit = 10)
        raise 'Too many HTTP redirects' if limit == 0

        response = Net::HTTP.get_response(URI(uri_str))

        case response
        when Net::HTTPSuccess then
          response
        when Net::HTTPRedirection then
          location = response['location']
          warn "redirected to #{location}"
          fetch(location, limit - 1)
        else
          response.value
        end
    end
end
