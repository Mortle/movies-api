# frozen_string_literal: true

module Api
  module V1
    class MoviesController < ApplicationController
      # GET /api/v1/movies/:id
      def show
        movie = Omdb::FetchMovie.call(imdb_id: params[:id]).movie

        if movie
          render json: movie_result.movie, status: :ok
        else
          render status: :not_found
        end
      end
    end
  end
end
