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
  mount_uploader :video, VideoUploader
end
