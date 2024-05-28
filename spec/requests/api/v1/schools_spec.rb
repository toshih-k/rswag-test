require 'swagger_helper'

RSpec.describe "Api::V1::Schools", type: :request do
  let (:school) {
    FactoryBot.build(:school)
  }
  school_schema = {
    type: :object,
    required: [:name, :address],
    properties: {
      name: { type: :string },
      address: { type: :string }
    },
  }

  path '/api/v1/schools' do
    get '教室一覧' do
      tags '教室API'
      consumes 'application/json'
      produces 'application/json'
      response 200, '一覧' do
        schema type: :array, items: school_schema
        run_test!
      end
    end

    post '教室登録' do
      tags '教室API'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :school, in: :body, schema: school_schema
      response 200, '教室登録結果' do
        schema type: :object,
          properties: {
            success: { type: :boolean },
            user: school_schema
          },
          required: [:success, :school]
        run_test!
      end
    end
  end

  path '/api/v1/schools/{id}' do
    let (:school) {
      FactoryBot.create(:school)
    }
    let(:id) {
      school.id
    }
    patch '教室編集' do
      tags '教室API'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :school, in: :body, schema: school_schema
      response 200, '教室編集結果' do
        schema type: :object,
          properties: {
            success: { type: :boolean },
            school: school_schema
          },
          required: [:success, :school]
        run_test!
      end
    end

    delete '教室削除' do
      tags '教室API'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response 200, '教室削除結果' do
        schema type: :object,
          properties: {
            success: { type: :boolean },
            school: school_schema
          },
          required: [:success, :school]
        run_test!
      end
    end
  end
end
