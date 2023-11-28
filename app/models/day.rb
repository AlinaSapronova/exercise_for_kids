# == Schema Information
#
# Table name: days
#
#  id           :integer          not null, primary key
#  completed_at :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  challenge_id :integer
#
class Day < ApplicationRecord
  belongs_to :challenge
  has_many :day_exercises
  has_many :exercises, through: :day_exercises, source: :exercises
  # has_many :day_completed_today, -> { completed_today }, class_name: "DayExercise"

end
