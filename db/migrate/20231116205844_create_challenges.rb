class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.integer :user_id
      t.boolean :active
      t.integer :child_id
      t.string :title
      t.integer :number_of_days

      t.timestamps
    end
  end
end
