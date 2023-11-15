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
  belongs_to :day, class_name: "Day", foreign_key: "day_id"
  mount_uploader :video, VideoUploader

  before_update :remove_old_video

  private

  def remove_old_video
    # Check if the video attribute has changed
    if video_changed?
      # Get the previous version of the record
      previous_version = Exercise.find(id)
      # Check if the old video exists
      if previous_version.video.present?
        # Extract the public_id from the old video uploader
        public_id = previous_version.video.file.public_id
        # Delete the old video from Cloudinary
        result = Cloudinary::Uploader.destroy(public_id, options = {})
        
      end
    end
  end
  
  
end
