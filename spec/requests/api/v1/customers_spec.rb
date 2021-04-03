require 'swagger_helper'

RSpec.describe Api::V1::CustomersController, type: :request do
  path '/api/v1/customers' do
    get 'All Customers' do
      tags 'Customers'
      security [bearerAuth: []]
      consumes 'application/json'
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
    end
  end
end
