# ceci est un commentaire
class VillesController < ApplicationController
  require "json"
  require "open-uri"

  def index
    Ville.destroy_all
    @search= params[:query]
    url = "https://geo.api.gouv.fr/communes?codePostal=#{@search}"
    ville_serialized = URI.open(url).read
    villes = JSON.parse(ville_serialized)

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
    @donnees = Ville.last
  end
end
