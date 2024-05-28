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
require 'rails_helper'

RSpec.describe UserSchoolAdmin, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
