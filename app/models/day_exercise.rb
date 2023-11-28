# == Schema Information
#
# Table name: day_exercises
#
#  id           :integer          not null, primary key
#  completed_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  day_id       :integer
#  exercise_id  :integer
#
class DayExercise < ApplicationRecord
  belongs_to :days
  belongs_to :exercises
  # scope :completed_today, -> { where(status: "done", completed_at: Date.today.all_day)  }
end
