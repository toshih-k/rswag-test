# == Schema Information
#
# Table name: user_school_admins
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  school_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserSchoolAdmin < ApplicationRecord
  belongs_to :school, inverse_of: :user_school_admins
  belongs_to :user, inverse_of: :user_school_admins
end
