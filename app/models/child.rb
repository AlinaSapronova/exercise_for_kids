# == Schema Information
#
# Table name: children
#
#  id         :integer          not null, primary key
#  birthday   :date
#  gender     :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Child < ApplicationRecord

  belongs_to :parent, class_name: "User", foreign_key: "user_id"
  has_many  :challenges, class_name: "Challenge", foreign_key: "child_id"

  def age
    (Date.today - self.birthday).to_i/365
  end
end
