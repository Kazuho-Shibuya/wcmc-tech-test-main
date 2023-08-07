module V1
  class SpeciesController < ApplicationController
    def index_in_location
      location = Location.find(params[:location_id])
      render json: location.species
    end
  end
end
