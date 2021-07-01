# frozen_string_literal: true

module Api
  module V1
    class MoviesController < ApplicationController
      before_action :find_persisted_movie, only: :show
      before_action :find_omdb_movie, only: :show

      # GET /api/v1/movies/:id
      def show
        authorize Movie, :show?

        unless @movie
          render json: formatted_errors('Record not found.'),
                 status: :not_found and return
        end

        render json: MovieSerializer.new(@movie).serializable_hash.to_json, status: :ok
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
