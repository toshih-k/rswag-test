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
class User < ApplicationRecord
  has_many :user_school_admins, inverse_of: :user
  has_many :user_students, inverse_of: :user
  has_many :user_teachers, inverse_of: :user
end
