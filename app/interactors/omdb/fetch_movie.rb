# frozen_string_literal: true

module Omdb
  class FetchMovie
    include Interactor

    delegate :imdb_id, :movie, to: :context

    def call
      fetch_omdb_movie
      persist_movie
    rescue StandardError => e
      context.fail!(error_message: e.message)
    end

    private

      def fetch_omdb_movie
        resp = Omdb::Client.new(i: imdb_id).fetch_movies

        context.fail!(error_message: resp['Error']) if resp.key?('Error')

        context.movie = resp
      end

      def persist_movie
        movie = Omdb::MovieParser.new(context.movie).parsed_movie

        return unless movie.persisted?

        context.movie = movie
      end
  end
end
