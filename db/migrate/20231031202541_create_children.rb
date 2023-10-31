class CreateChildren < ActiveRecord::Migration[7.0]
  def change
    create_table :children do |t|
      t.integer :user_id
      t.date :birthday
      t.string :name
      t.string :gender

      t.timestamps
    end
  end
end
