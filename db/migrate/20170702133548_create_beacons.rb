class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.string :descrizione
      t.string :UUID
      t.decimal :major
      t.decimal :minor

      t.timestamps null: false
    end
  end
end
