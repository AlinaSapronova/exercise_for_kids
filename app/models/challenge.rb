# == Schema Information
#
# Table name: challenges
#
#  id         :integer          not null, primary key
#  active     :boolean
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  child_id   :integer
#  user_id    :integer
#
class Challenge < ApplicationRecord
end
