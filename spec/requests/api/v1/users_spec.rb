require 'swagger_helper'

RSpec.describe "Api::V1::Users", type: :request do
  let (:user) {
    FactoryBot.build(:user)
  }

  user_schema = {
    type: :object,
    required: [:name, :email],
    properties: {
      name: { type: :string },
      email: { type: :string }
    },
  }

  path '/api/v1/users' do
    get 'ユーザー一覧' do
      tags 'ユーザーAPI'
      consumes 'application/json'
      produces 'application/json'
      response 200, '一覧' do
        schema type: :array, items: user_schema
        run_test!
      end
    end

    post 'ユーザー登録' do
      tags 'ユーザーAPI'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: user_schema
      response 200, 'ユーザー登録結果' do
        schema type: :object,
          properties: {
            success: { type: :boolean },
            user: user_schema
          },
          required: [:success, :user]
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    let (:user) {
      FactoryBot.create(:user)
    }
    let(:id) {
      user.id
    }
    patch 'ユーザー編集' do
      tags 'ユーザーAPI'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :user, in: :body, schema: user_schema
      response 200, 'ユーザー編集結果' do
        schema type: :object,
          properties: {
            success: { type: :boolean },
            user: user_schema
          },
          required: [:success, :user]
        run_test!
      end
    end

    delete 'ユーザー削除' do
      tags 'ユーザーAPI'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response 200, 'ユーザー削除結果' do
        schema type: :object,
          properties: {
            success: { type: :boolean },
            user: user_schema
          },
          required: [:success, :user]
        run_test!
      end
    end
  end
end
