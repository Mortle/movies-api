# frozen_string_literal: true

module Omdb
  class FetchMovie
    include Interactor

    delegate :omdb_id, :movie, to: :context

    def call
      fetch_omdb_movie
    rescue StandardError => e
      context.fail!(error_message: e.message)
    end

    private

      def fetch_omdb_movie
        resp = Omdb::Client.new(i: omdb_id).fetch_movies

        context.fail!(error_message: resp['Error']) if resp.key?('Error')

        context.movie = resp
      end
  end
end
