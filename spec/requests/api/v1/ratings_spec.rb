# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'API Ratings', type: :request do
  path '/api/v1/movies/{movie_id}/ratings' do
    parameter name: :movie_id, in: :path, type: :string

    get('List ratings for movie') do
      tags 'Ratings'
      produces 'application/json'
      consumes 'application/json'
      security [client: [], 'access-token': [], uid: []]

      response '200', 'OK' do
        schema type: :array,
               items: {
                 '$ref' => '#/components/schemas/rating_data'
               }

        xit
      end

      response '401', 'Unauthorized' do
        schema '$ref' => '#/components/schemas/failure_message'

        xit
      end

      response '404', 'Record not found' do
        schema '$ref' => '#/components/schemas/failure_message'

        xit
      end
    end

    post('create rating') do
      tags 'Ratings'
      produces 'application/json'
      consumes 'application/json'
      security [client: [], 'access-token': [], uid: []]

      parameter name: :show, in: :body, schema: {
        '$ref' => '#/components/schemas/rating'
      }

      response '201', 'Created' do
        schema '$ref' => '#/components/schemas/rating_data'

        xit
      end

      response '401', 'Unauthorized' do
        schema '$ref' => '#/components/schemas/failure_message'

        xit
      end

      response '404', 'Record not found' do
        schema '$ref' => '#/components/schemas/failure_message'

        xit
      end

      response '422', 'Unprocessable entity' do
        schema '$ref' => '#/components/schemas/failure_message'

        xit
      end
    end
  end

  path '/api/v1/movies/{movie_id}/ratings/{id}' do
    parameter name: 'movie_id', in: :path, type: :string
    parameter name: 'id', in: :path, type: :string

    get 'show Rating' do
      tags 'Ratings'
      produces 'application/json'
      consumes 'application/json'
      security [client: [], 'access-token': [], uid: []]

      response '200', 'OK' do
        schema '$ref' => '#/components/schemas/rating_data'

        xit
      end

      response '401', 'Unauthorized' do
        schema '$ref' => '#/components/schemas/failure_message'

        xit
      end

      response '404', 'Record not found' do
        schema '$ref' => '#/components/schemas/failure_message'

        xit
      end
    end

    patch 'Update rating' do
      tags 'Ratings'
      produces 'application/json'
      consumes 'application/json'
      security [client: [], 'access-token': [], uid: []]

      parameter name: :show, in: :body, schema: {
        '$ref' => '#/components/schemas/rating'
      }

      response '200', 'OK' do
        schema '$ref' => '#/components/schemas/rating_data'

        xit
      end

      response '401', 'Unauthorized' do
        schema '$ref' => '#/components/schemas/failure_message'

        xit
      end

      response '404', 'Record not found' do
        schema '$ref' => '#/components/schemas/failure_message'

        xit
      end

      response '422', 'Unprocessable entity' do
        schema '$ref' => '#/components/schemas/failure_message'

        xit
      end
    end

    delete 'Delete rating' do
      tags 'Ratings'
      produces 'application/json'
      consumes 'application/json'
      security [client: [], 'access-token': [], uid: []]

      response '200', 'OK' do
        schema '$ref' => '#/components/schemas/success_message'

        xit
      end

      response '401', 'Unauthorized' do
        schema '$ref' => '#/components/schemas/failure_message'

        xit
      end

      response '404', 'Record not found' do
        schema '$ref' => '#/components/schemas/failure_message'

        xit
      end

      response '422', 'Unprocessable entity' do
        schema '$ref' => '#/components/schemas/failure_message'

        xit
      end
    end
  end
end
