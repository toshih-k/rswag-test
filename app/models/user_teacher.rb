# == Schema Information
#
# Table name: user_teachers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  school_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserTeacher < ApplicationRecord
  belongs_to :school, inverse_of: :user_teachers
  belongs_to :user, inverse_of: :user_teachers
end
