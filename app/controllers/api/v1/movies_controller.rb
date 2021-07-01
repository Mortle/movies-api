# frozen_string_literal: true

module Api
  module V1
    class MoviesController < ApplicationController
      # GET /api/v1/movies/:id
      def show
        movie_result = Omdb::FetchMovie.call(omdb_id: params[:id])

        return render status: :not_found unless movie_result

        if movie_result.movie
          render json: movie_result.movie, status: :ok
        else
          render status: :not_found
        end
      end
    end
  end
end
