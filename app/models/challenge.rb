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
  has_many  :days, class_name: "Day", foreign_key: "challenge_id"
  belongs_to :parent, class_name: "User", foreign_key: "user_id"
  belongs_to :child, class_name: "Child", foreign_key: "child_id"

end
