class AddColumnNumberOfDaysToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :number_of_days, :integer
  end
end
