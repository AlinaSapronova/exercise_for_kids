# == Schema Information
#
# Table name: exercises
#
#  id         :integer          not null, primary key
#  title      :string
#  video      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Exercise < ApplicationRecord
  belongs_to :day, required: true, class_name: "Day", foreign_key: "day_id"
  mount_uploader :video, VideoUploader
end
