class RemoveCodePostalFromVille < ActiveRecord::Migration[7.0]
  def change
    remove_column :villes, :codePostal, :string
  end
end
