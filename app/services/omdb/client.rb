# frozen_string_literal: true

module Omdb
  class Client
    include HTTParty

    base_uri 'http://www.omdbapi.com'
    headers 'Content-Type' => 'application/json'

    def initialize(options)
      @options = { query: options.merge(apikey: ENV['OMDB_API_KEY']) }
    end

    def fetch_movies
      self.class.get('/', @options)
    end
  end
end
