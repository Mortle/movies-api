# frozen_string_literal: true

module Api
  module V1
    class RatingsController < ApplicationController
      before_action :set_movie
      before_action :find_omdb_movie
      before_action :set_rating, only: %i[show update destroy]

      # GET /api/v1/movies/:movie_id/ratings
      def index
        authorize Rating, :index?

        render json: RatingSerializer.new(@movie.ratings).serializable_hash.to_json, status: :ok
      end

      # POST /api/v1/movies/:movie_id/ratings
      def create
        authorize Rating, :create?

        rating = Rating.new(create_rating_params)
        if rating.save
          render json: RatingSerializer.new(show).serializable_hash.to_json, status: :created
        else
          render json: formatted_errors('Could not create rating', @rating.errors),
                 status: :unprocessable_entity
        end
      end

      # GET /api/v1/movies/:movie_id/ratings/:id
      def show
        authorize Rating, :show?

        render json: RatingSerializer.new(@rating).serializable_hash.to_json, status: :ok
      end

      # PATCH /api/v1/movies/:movie_id/ratings/:id
      def update
        authorize Rating, :update?

        if @rating.update(update_rating_params)
          render json: RatingSerializer.new(@rating).serializable_hash.to_json, status: :ok
        else
          render json: formatted_errors('Could not update rating', @rating.errors),
                 status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/movies/:movie_id/ratings/:id
      def destroy
        authorize Rating, :destroy?

        if @rating.destroy
          render json: formatted_message('Rating successfully deleted'), status: :ok
        else
          render json: formatted_errors('Could not delete rating', @rating.errors),
                 status: :unprocessable_entity
        end
      end

      private

        def create_rating_params
          params.require(:rating).permit(:source, :value).merge(movie_id: @movie.id, system: true, creator: pundit_user)
        end

        def update_rating_params
          params.require(:rating).permit(:source, :value)
        end

        def set_rating
          @rating = Rating.find(params[:id])
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
