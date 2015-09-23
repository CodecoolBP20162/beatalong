require 'httparty'

module Api
  class AppleMusic
    include HTTParty
    base_uri 'https://itunes.apple.com'
    format :json

    class << self
      def search(query={})
        get("/search", query: query)["results"]
      end

      def lookup(query={})
        get("/lookup", query: query)["results"]
      end

      def find(id)
        lookup(id: id).first
      end
    end
  end
end
