# frozen_string_literal: true

# @see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  namespace :v1 do
    get '/species/:location_id', to: 'species#index_in_location'
    get '/locations/:species_id', to: 'locations#index_in_species'
  end
end
