# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー' do
    let :user do
      FactoryBot.create(:user)
    end

    it 'ユーザーがエラーなしで登録できる' do
      user_hash = FactoryBot.build(:user).as_json
      user = User.new(user_hash)
      user.save!
      expect(user.errors.size).to eq 0
    end
  end
end
