# frozen_string_literal: true

module Omdb
  class MovieParser
    def initialize(movie_params)
      @movie_params = movie_params
    end

    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def parsed_movie
      @movie = Movie.create(
        title: @movie_params['Title'],
        year: @movie_params['Year'].to_i,
        rated: @movie_params['Rated'],
        released: @movie_params['Released'],
        runtime: @movie_params['Runtime'],
        genre: @movie_params['Genre'],
        director: @movie_params['Director'],
        writer: @movie_params['Writer'],
        actors: @movie_params['Actors'],
        plot: @movie_params['Plot'],
        language: @movie_params['Language'],
        country: @movie_params['Country'],
        poster: @movie_params['Poster'],
        metascore: @movie_params['Metascore'],
        imdb_rating: @movie_params['imdbRating'].to_f,
        imdb_votes: @movie_params['imdbVotes'],
        imdb_id: @movie_params['imdbID'],
        dvd: @movie_params['DVD'],
        production: @movie_params['Production']
      )

      @movie.update(ratings: parsed_rating)

      @movie
    end
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

    private

      def parsed_rating
        @movie_params['Ratings'].map do |rating|
          Rating.create!(
            source: rating['Source'],
            value: rating['Value'],
            movie: @movie,
            system: false
          )
        end
      end
  end
end
