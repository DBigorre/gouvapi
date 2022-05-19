class CreateVilles < ActiveRecord::Migration[7.0]
  def change
    create_table :villes do |t|
      t.string :codePostal
      t.integer :lon
      t.integer :lat
      t.string :nom
      t.string :boost
      t.string :code
      t.string :codeDepartement
      t.string :codeRegion
      t.text :fields, array: true, default: []
      t.string :format

      t.timestamps
    end
  end
end
