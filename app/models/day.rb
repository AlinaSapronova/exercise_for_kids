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

  has_many :exercises, class_name: "Exercise", foreign_key: "exercise_id"

end
