# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"

Ville.destroy_all

@search= "78000"
url = "https://geo.api.gouv.fr/communes?codePostal=#{@search}"
ville_serialized = URI.open(url).read
villes = JSON.parse(ville_serialized)

puts "each do"

puts villes
villes.each do |ville|
  puts "Creating #{ville['nom']}"
  Ville.create!(
    nom: ville['nom'],
    code: ville['code'],
    codeDepartement: ville['codeDepartement'],
    codeRegion: ville['codeRegion'],
    codePostal: ville['codesPostaux']
  )
end
puts "Ville créée"
