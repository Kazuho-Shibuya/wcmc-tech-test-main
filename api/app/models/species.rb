class Species < ApplicationRecord
  has_many :locations, through: :species_locations
  has_many :species_locations
end
