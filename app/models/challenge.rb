# == Schema Information
#
# Table name: challenges
#
#  id             :integer          not null, primary key
#  active         :boolean
#  number_of_days :integer
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  child_id       :integer
#  user_id        :integer
#
class Challenge < ApplicationRecord
  
  has_many  :days, class_name: "Day", foreign_key: "challenge_id"
  belongs_to :user
  belongs_to :child

end


