# == Schema Information
#
# Table name: days
#
#  id           :integer          not null, primary key
#  completed_at :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  challenge_id :integer
#  exercise_id  :integer
#
class Day < ApplicationRecord
  belongs_to :challenge, class_name: "Challenge", foreign_key: "challenge_id"

  # has_many :exercises, class_name: "Exercise", foreign_key: "day_id"

end
