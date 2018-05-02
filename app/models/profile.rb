class Profile < ApplicationRecord
  belongs_to :user

  geocoded_by :home_address
  after_validation :geocode
end