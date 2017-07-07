class CreateCamprighes < ActiveRecord::Migration
  def change
    create_table :camprighes do |t|
      t.string :camp_id
      t.string :contact_id

      t.timestamps null: false
    end
  end
end
