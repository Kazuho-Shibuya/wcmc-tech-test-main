# frozen_string_literal: true
puts '== Installing seeds data =='

# CSV import to database
puts '== Importing CSV data =='
require 'csv'
FILE = "lib/data/species_locations.csv"

opened_file = File.open(FILE)
options = { headers: true }
CSV.foreach(opened_file, **options) do |row|
  species_hash = {}
  location_hash = {}
  species_locations_hash = {}
  species_id = row["scientificNameID"]
  location_name = row["locality"]

  location_hash[:name] = location_name
  species_hash[:id] = species_id
  species_hash[:name] = row["scientificName"]
  Species.find_or_create_by!(species_hash)
  Location.find_or_create_by!(location_hash)

  species_locations_hash[:species_id] = species_id
  species_locations_hash[:location_id] = Location.find_by!(name: location_name).id
  SpeciesLocation.find_or_create_by!(species_locations_hash)
end