require 'swagger_helper'

RSpec.describe Api::V1::WinesController, type: :request do
  path '/api/v1/wines' do
    get 'All Wines' do
      tags 'Wines'
      security [bearerAuth: []]
      consumes 'application/json'
      response '200', 'Ok' do
        let(:Authorization) { "Bearer #{auth_header(user)}" }
        run_test!
      end
      response '401', 'Unauthorized' do
        run_test!
      end
    end
    post 'Create a Wine' do
      tags 'Wines'
      security [bearerAuth: []]
      consumes 'application/json'
      response '201', 'Created' do
        let(:Authorization) { "Bearer #{auth_header(user)}" }
        run_test!
      end
      response '401', 'Unauthorized' do
        run_test!
      end
      response '403', 'Forbidden' do
        let(:Authorization) { "Bearer #{auth_header(user)}" }
        run_test!
      end
      response '422', 'Invalid request' do
        let(:Authorization) { "Bearer #{auth_header(user)}" }
        run_test!
      end
    end
  end
  path '/api/v1/wines/{id}' do
    get 'Show Wine' do
      tags 'Wines'
      security [bearerAuth: []]
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'Ok' do
        let(:Authorization) { "Bearer #{auth_header(user)}" }
        run_test!
      end
      response '401', 'Unauthorized' do
        run_test!
      end
      response '403', 'Forbidden' do
        let(:Authorization) { "Bearer #{auth_header(user)}" }
        run_test!
      end
      response '404', 'Not Found' do
        let(:Authorization) { "Bearer #{auth_header(user)}" }
        run_test!
      end
    end
    put 'Update a Wine' do
      tags 'Wines'
      security [bearerAuth: []]
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'Ok' do
        let(:Authorization) { "Bearer #{auth_header(user)}" }
        run_test!
      end
      response '401', 'Unauthorized' do
        run_test!
      end
      response '403', 'Forbidden' do
        let(:Authorization) { "Bearer #{auth_header(user)}" }
        run_test!
      end
      response '404', 'Not Found' do
        let(:Authorization) { "Bearer #{auth_header(user)}" }
        run_test!
      end
      response '422', 'Invalid request' do
        let(:Authorization) { "Bearer #{auth_header(user)}" }
        run_test!
      end
    end
    delete 'Destroy a Wine' do
      tags 'Wines'
      security [bearerAuth: []]
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      response '204', 'No Content' do
        let(:Authorization) { "Bearer #{auth_header(user)}" }
        run_test!
      end
      response '401', 'Unauthorized' do
        run_test!
      end
      response '403', 'Forbidden' do
        let(:Authorization) { "Bearer #{auth_header(user)}" }
        run_test!
      end
      response '404', 'Not Found' do
        let(:Authorization) { "Bearer #{auth_header(user)}" }
        run_test!
      end
    end
  end
  path '/api/v1/wines/search' do
    get 'Search Wine by name' do
      tags 'Wines'
      security [bearerAuth: []]
      consumes 'application/json'
      parameter name: :q, in: :query, type: :string
      response '200', 'Ok' do
        let(:Authorization) { "Bearer #{auth_header(user)}" }
        run_test!
      end
      response '401', 'Unauthorized' do
        let(:Authorization) { "Bearer #{auth_header(user)}" }
        run_test!
      end
    end
  end
end
