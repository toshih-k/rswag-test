require 'swagger_helper'

RSpec.describe "Api::V1::Users", type: :request do
  path '/api/v1/users' do
    get 'get user list' do
      consumes 'application/json'
      produces 'application/json'
      response 200, 'user list' do
        schema type: :array, items: {
          type: :object,
          properties: {
            name: { type: :string },
            email: { type: :string },
          },
          required: [:name, :email]
        }
        run_test!
      end
    end
  end
end
