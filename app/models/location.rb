class Location < ApplicationRecord
  has_one :booking

  geocoded_by :address
  before_validation :geocode

  validates :longitude, :latitude, presence: true
end