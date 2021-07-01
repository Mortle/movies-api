# frozen_string_literal: true

module Api
  module V1
    class MoviesController < ApplicationController
      before_action :find_persisted_movie, only: :show
      before_action :find_omdb_movie, only: :show

      # GET /api/v1/movies/:id
      def show
        # TODO: equal response for OMDb fetched movie and persisted movie
        return render status: :not_found unless @movie

        render json: @movie, status: :ok
      end

      private

        def find_persisted_movie
          @movie = Movie.find_by(imdb_id: params[:id])
        end

        def find_omdb_movie
          @movie ||= Omdb::FetchMovie.call(imdb_id: params[:id]).movie
        end
    end
  end
end
