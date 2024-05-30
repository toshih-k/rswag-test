# frozen_string_literal: true

# == Schema Information
#
# Table name: user_teachers
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  school_id  :integer
#  user_id    :integer
#
# Indexes
#
#  index_user_teachers_on_school_id  (school_id)
#  index_user_teachers_on_user_id    (user_id)
#
require 'rails_helper'

RSpec.describe UserTeacher, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
