class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.integer :day_id
      t.string :title
      t.string :video
      

      t.timestamps
    end
  end
end
