class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :nome
      t.string :cognome
      t.string :telefono
      t.string :email
      t.string :sesso
      t.string :citta
      t.string :provincia
      t.string :nazione

      t.timestamps null: false
    end
  end
end
