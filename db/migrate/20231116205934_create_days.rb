class CreateDays < ActiveRecord::Migration[7.0]
  def change
    create_table :days do |t|
      t.integer :challenge_id
      t.date :completed_at

      t.timestamps
    end
  end
end
