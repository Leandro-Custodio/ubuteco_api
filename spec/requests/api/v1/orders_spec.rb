require 'swagger_helper'

RSpec.describe Api::V1::OrdersController, type: :request do
  before :all do
    @organization = create(:organization)
    @admin = @organization.user
    @orders = create_list(:order, 10, organization: @organization)
  end

  path '/api/v1/orders' do
    get 'All Orders' do
      tags 'Orders'
      security [Bearer: {}]
      response 200, 'Ok' do
        let(:'Authorization') { auth_header(@admin)['Authorization'] }
        run_test!
      end
    end
    post 'Create a Order' do
      tags 'Orders'
      security [Bearer: {}]
      parameter in: :body, type: :object,
                schema: {
                  properties: {
                    organization_id: { type: :integer },
                    table_id: { type: :integer },
                    status: { type: :integer },
                    user_id: { type: :integer },
                    discount: { type: :integer },
                    total: { type: :integer },
                    total_with_discount: { type: :integer },
                  },
                  required: %w[organization_id]
                }
      response 201, 'Created' do
        let(:'Authorization') { auth_header(@admin)['Authorization'] }
        schema type: :object,
               properties: {
                 organization_id: { type: :integer },
                 table_id: { type: :integer },
                 status: { type: :integer },
                 user_id: { type: :integer },
                 discount: { type: :integer },
                 total: { type: :integer },
                 total_with_discount: { type: :integer },
               },
               required: %w[organization_id status]
        run_test!
      end

      response 404, 'Not Found' do
        let(:'Authorization') { auth_header(@admin)['Authorization'] }
        run_test!
      end
      response 422, 'Invalid request' do
        let(:'Authorization') { auth_header(@admin)['Authorization'] }
        schema '$ref' => '#/components/schemas/errors_object'
        run_test!
      end
    end
  end
  path '/api/v1/orders/{id}' do
    get 'Show Order' do
      tags 'Orders'
      security [Bearer: {}]
      parameter name: :id, in: :path, type: :string
      response 200, 'Ok' do
        let(:'Authorization') { auth_header(@admin)['Authorization'] }
        run_test!
      end
      response 404, 'Not Found' do
        let(:'Authorization') { auth_header(@admin)['Authorization'] }
        run_test!
      end
    end
    put 'Update a Order' do
      tags 'Orders'
      security [Bearer: {}]
      parameter name: :id, in: :path, type: :string
      parameter in: :body, type: :object,
                schema: {
                  properties: {
                    organization_id: { type: :integer },
                    table_id: { type: :integer },
                    status: { type: :integer },
                    user_id: { type: :integer },
                    discount: { type: :integer },
                    total: { type: :integer },
                    total_with_discount: { type: :integer },
                  },
                  required: %w[organization_id]
                }
      response 200, 'Ok' do
        let(:'Authorization') { auth_header(@admin)['Authorization'] }
        schema type: :object,
               properties: {
                 organization_id: { type: :integer },
                 table_id: { type: :integer },
                 status: { type: :integer },
                 user_id: { type: :integer },
                 discount: { type: :integer },
                 total: { type: :integer },
                 total_with_discount: { type: :integer },
               },
               required: %w[organization_id status]
        run_test!
      end
      response 404, 'Not Found' do
        let(:'Authorization') { auth_header(@admin)['Authorization'] }
        run_test!
      end
      response 422, 'Invalid request' do
        let(:'Authorization') { auth_header(@admin)['Authorization'] }
        schema '$ref' => '#/components/schemas/errors_object'
        run_test!
      end
    end
    delete 'Destroy a Order' do
      tags 'Orders'
      security [Bearer: {}]
      parameter name: :id, in: :path, type: :string
      response 204, 'No Content' do
        let(:'Authorization') { auth_header(@admin)['Authorization'] }
        run_test!
      end
      response 404, 'Not Found' do
        let(:'Authorization') { auth_header(@admin)['Authorization'] }
        run_test!
      end
    end
  end
  path '/api/v1/orders/search' do
    get 'Search Order by created_at, total_cents, total_with_discount_cents, table name, customer name' do
      tags 'Orders'
      security [Bearer: {}]
      parameter name: :q, in: :query, type: :string
      response 200, 'Ok' do
        let(:'Authorization') { auth_header(@admin)['Authorization'] }
        run_test!
      end
    end
  end
end
