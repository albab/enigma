class CreateRiddles < ActiveRecord::Migration
  def change
    create_table :riddles do |t|
      t.string :question
      t.string :answer
      t.integer :points
      t.string :lat
      t.string :lon
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
