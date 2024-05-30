# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Api::V1::Sessions', type: :request do
  path '/api/v1/sessions' do
    post 'ログイン' do
      tags 'セッション管理'
      description 'ログインする'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :session, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %i[email password]
      }
      response 200, 'ログイン結果' do
        let(:session) do
          { email: 'hoge@example.com', password: 'fuga' }
        end
        schema type: :object,
               properties: {
                 success: { type: :boolean }
               },
               required: [:success]
        run_test!
      end
    end
    get 'ログイン情報取得' do
      tags 'セッション管理'
      description 'ログインユーザーの情報を取得する'
      consumes 'application/json'
      produces 'application/json'
      security [Bearer: {}] ############### 追加
      response 200, 'ログイン結果' do
        schema type: :object,
               properties: {
                 success: { type: :boolean },
                 user: {
                   type: :object,
                   properties: {
                     name: { type: :string },
                     email: { type: :string }
                   }
                 }
               },
               required: %i[success user]
        run_test!
      end
    end
  end
end
