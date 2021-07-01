# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {},
      servers: [
        {
          url: 'http://{defaultHost}',
          variables: {
            defaultHost: {
              default: 'localhost:3000/'
            }
          }
        }
      ],
      components: {
        securitySchemes: {
          client: {
            type: 'apiKey',
            name: 'client',
            in: 'header'
          },
          'access-token': {
            type: 'apiKey',
            name: 'access-token',
            in: 'header'
          },
          uid: {
            type: 'apiKey',
            name: 'uid',
            in: 'header'
          }
        },
        security: {
          client: [],
          'access-token': [],
          uid: []
        },
        schemas: {
          success_message: {
            type: :object,
            properties: {
              message: { type: :string }
            }
          },
          failure_message: {
            type: :object,
            properties: {
              message: { type: :string },
              errors: { type: :object }
            }
          },
          show: {
            type: :object,
            properties: {
              date_end: { type: :string },
              date_start: { type: :string },
              price: { type: :integer }
            }
          },
          show_data: {
            type: :object,
            properties: {
              data: {
                type: :object,
                properties: {
                  id: { type: :integer },
                  type: { type: :string },
                  attributes: {
                    type: :object,
                    properties: {
                      date_end: { type: :string },
                      date_start: { type: :string },
                      price: { type: :integer },
                      movie: {
                        type: :object,
                        properties: {
                          movie_id: { type: :integer },
                          title: { type: :string }
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          rating: {
            type: :object,
            properties: {
              source: { type: :string },
              value: { type: :string }
            }
          },
          rating_data: {
            type: :object,
            properties: {
              data: {
                type: :object,
                properties: {
                  id: { type: :integer },
                  type: { type: :string },
                  attributes: {
                    type: :object,
                    properties: {
                      source: { type: :string },
                      value: { type: :string },
                      creator: {
                        type: :object,
                        properties: {
                          creator_id: { type: :integer },
                          creator_type: { type: :string }
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          movie_data: {
            type: :object,
            properties: {
              data: {
                type: :object,
                properties: {
                  id: { type: :integer },
                  type: { type: :string },
                  attributes: {
                    type: :object,
                    properties: {
                      imdb_id: { type: :string },
                      title: { type: :string },
                      year: { type: :string },
                      rated: { type: :string },
                      released: { type: :string },
                      runtime: { type: :string },
                      genre: { type: :string },
                      director: { type: :string },
                      writer: { type: :string },
                      actors: { type: :string },
                      plot: { type: :string },
                      language: { type: :string },
                      country: { type: :string },
                      poster: { type: :string },
                      metascore: { type: :string },
                      imdb_rating: { type: :string },
                      imdb_votes: { type: :string },
                      dvd: { type: :string },
                      production: { type: :string },
                      rating: {
                        'ref' => '#/components/schemas/rating_data'
                      },
                      system_rating: {
                        'ref' => '#/components/schemas/rating_data'
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
end
