# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'API Shows', type: :request do
  path '/api/v1/movies/{movie_id}/shows' do
    parameter name: :movie_id, in: :path, type: :string

    get('List shows for movie') do
      tags 'Shows'
      produces 'application/json'
      consumes 'application/json'
      security [client: [], 'access-token': [], uid: []]

      response '200', 'OK' do
        schema type: :array,
               items: {
                 '$ref' => '#/components/schemas/show_data'
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

    post('create show') do
      tags 'Shows'
      produces 'application/json'
      consumes 'application/json'
      security [client: [], 'access-token': [], uid: []]

      parameter name: :show, in: :body, schema: {
        '$ref' => '#/components/schemas/show'
      }

      response '201', 'Created' do
        schema '$ref' => '#/components/schemas/show_data'

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

  path '/api/v1/movies/{movie_id}/shows/{id}' do
    parameter name: 'movie_id', in: :path, type: :string
    parameter name: 'id', in: :path, type: :string

    get 'Show' do
      tags 'Shows'
      produces 'application/json'
      consumes 'application/json'
      security [client: [], 'access-token': [], uid: []]

      response '200', 'OK' do
        schema '$ref' => '#/components/schemas/show_data'

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

    patch 'Update show' do
      tags 'Shows'
      produces 'application/json'
      consumes 'application/json'
      security [client: [], 'access-token': [], uid: []]

      parameter name: :show, in: :body, schema: {
        '$ref' => '#/components/schemas/show'
      }

      response '200', 'OK' do
        schema '$ref' => '#/components/schemas/show_data'

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

    delete 'Delete show' do
      tags 'Shows'
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
