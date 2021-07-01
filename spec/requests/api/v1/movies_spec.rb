# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'API Ratings', type: :request do
  path '/api/v1/movies/{id}' do
    parameter name: :id, in: :path, type: :string, description: 'imdb_id'

    get('Movie or fetch from Omdb') do
      tags 'Movies'
      produces 'application/json'
      consumes 'application/json'

      response '200', 'OK' do
        schema type: :array,
               items: {
                 '$ref' => '#/components/schemas/movie_data'
               }

        xit
      end
    end
  end
end
