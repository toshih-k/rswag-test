# == Schema Information
#
# Table name: user_students
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  school_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserStudent < ApplicationRecord
  belongs_to :school, inverse_of: :user_students
  belongs_to :user, inverse_of: :user_students
end
