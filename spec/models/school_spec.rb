# frozen_string_literal: true

# == Schema Information
#
# Table name: schools
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe School, type: :model do
  let :school do
    FactoryBot.create(:school)
  end

  it '教室がエラーなしで登録できる' do
    school_hash = FactoryBot.build(:school).as_json
    school = School.new(school_hash)
    school.save!
    expect(school.errors.size).to eq 0
  end
end
