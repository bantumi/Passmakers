class CreateCamptesta < ActiveRecord::Migration
  def change
    create_table :camptesta do |t|
      t.string :descrizione
      t.string :user_id
      t.integer :tipo

      t.timestamps null: false
    end
  end
end
