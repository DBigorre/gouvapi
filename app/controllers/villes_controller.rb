# ceci est un commentaire
class VillesController < ApplicationController
  def index
    @villes = Ville.all
  end
end
