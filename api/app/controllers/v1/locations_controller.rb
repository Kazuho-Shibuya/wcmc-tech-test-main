module V1
  class LocationsController < ApplicationController
    def index_in_species
      species = Species.find(params[:species_id])
      render json: species.locations
    end
  end
end
