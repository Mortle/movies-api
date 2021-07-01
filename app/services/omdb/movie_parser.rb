# frozen_string_literal: true

module Omdb
  class MovieParser
    def initialize(movie_params)
      @movie_params = movie_params
    end

    # TODO: save rating
    # {
    #   "Source": "Metacritic",
    #   "Value": "58/100"
    # }

    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def parsed_movie
      Movie.create(
        title: @movie_params['Title'],
        year: @movie_params['Year'].to_i,
        rated: @movie_params['Rated'],
        released: @movie_params['Released'],
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
    end
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
  end
end
