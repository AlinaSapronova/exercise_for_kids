class CreateDayExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :day_exercises do |t|
      t.integer :day_id
      t.integer :exercise_id
      t.datetime :completed_at

      t.timestamps
    end
  end
end
