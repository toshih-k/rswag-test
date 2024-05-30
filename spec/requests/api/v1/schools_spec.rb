# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Api::V1::Schools', type: :request do
  let(:school) do
    FactoryBot.build(:school)
  end
  school_schema = {
    type: :object,
    required: %i[name address],
    properties: {
      name: { type: :string },
      address: { type: :string }
    }
  }

  path '/api/v1/schools' do
    get '教室一覧' do
      tags '教室API'
      description <<~EOS

        # 教室の一覧を取得する

        aaaaa
        bbbb

      EOS
      consumes 'application/json'
      produces 'application/json'
      response 200, '一覧' do
        schema type: :array, items: school_schema
        run_test!
      end
    end

    post '教室登録' do
      tags '教室API'
      description '教室を登録する'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :school, in: :body, schema: school_schema
      response 200, '教室登録結果' do
        schema type: :object,
               properties: {
                 success: { type: :boolean },
                 user: school_schema
               },
               required: %i[success school]
        run_test!
      end
    end
  end

  path '/api/v1/schools/{id}' do
    let(:school) do
      FactoryBot.create(:school)
    end
    let(:id) do
      school.id
    end
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
               required: %i[success school]
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
               required: %i[success school]
        run_test!
      end
    end
  end
end
