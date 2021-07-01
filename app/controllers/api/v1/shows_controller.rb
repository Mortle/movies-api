# frozen_string_literal: true

module Api
  module V1
    class ShowsController < ApplicationController
      before_action :set_movie
      before_action :find_omdb_movie
      before_action :set_show, only: %i[show update destroy]

      # GET /api/v1/movies/:movie_id/shows
      def index
        authorize Show, :index?

        render json: ShowSerializer.new(@movie.shows.active).serializable_hash.to_json, status: :ok
      end

      # POST /api/v1/movies/:movie_id/shows
      def create
        authorize Show, :create?

        show = Show.new(create_show_params)
        if show.save
          render json: ShowSerializer.new(show).serializable_hash.to_json, status: :created
        else
          render json: formatted_errors('Could not create show', @show.errors),
                 status: :unprocessable_entity
        end
      end

      # GET /api/v1/movies/:movie_id/shows/:id
      def show
        authorize @show, :show?

        render json: ShowSerializer.new(@show).serializable_hash.to_json, status: :ok
      end

      # PATCH /api/v1/movies/:movie_id/shows/:id
      def update
        authorize @show, :update?

        if @show.update(update_show_params)
          render json: ShowSerializer.new(@show).serializable_hash.to_json, status: :ok
        else
          render json: formatted_errors('Could not update show', @show.errors),
                 status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/movies/:movie_id/shows/:id
      def destroy
        authorize @show, :destroy?

        if @show.destroy
          render json: formatted_message('Show successfully deleted'), status: :ok
        else
          render json: formatted_errors('Could not delete show', @show.errors),
                 status: :unprocessable_entity
        end
      end

      private

        def create_show_params
          params.require(:show).permit(:date_end, :date_start, :price).merge(movie_id: @movie.id)
        end

        def update_show_params
          params.require(:show).permit(:date_end, :date_start, :price)
        end

        def set_show
          @show = Show.find(params[:id])
        end

        def set_movie
          @movie = Movie.find_by!(imdb_id: params[:movie_id])
        end

        def find_omdb_movie
          @movie ||= Omdb::FetchMovie.call(imdb_id: params[:movie_id]).movie
        end
    end
  end
end
