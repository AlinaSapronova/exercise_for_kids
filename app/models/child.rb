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

  def age
    (Date.today - self.birthday).to_i/365
  end
end
