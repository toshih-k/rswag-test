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
class School < ApplicationRecord
  has_many :user_school_admins, inverse_of: :school
  has_many :user_students, inverse_of: :school
  has_many :user_teachers, inverse_of: :school
end
