class Location < ApplicationRecord
  has_one :booking

  geocoded_by :address
  after_validation :geocode
end