class AddCodePostalToVille < ActiveRecord::Migration[7.0]
  def change
    add_column :villes, :codePostal, :string
  end
end
