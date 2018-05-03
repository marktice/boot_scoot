class Booking < ApplicationRecord
  belongs_to :passenger,    class_name: 'User'
  belongs_to :driver,       class_name: 'User', optional: true

  belongs_to :origin,       class_name: 'Location', foreign_key: 'origin_id'
  belongs_to :destination,  class_name: 'Location', foreign_key: 'destination_id'


  # def distance
  #   # @_distance ||= Geocoder::Calculations.distance_between(self.locations.first.address, self.locations.last.address)
  #   @_distance ||= self.origin.distance_from(self.destination.to_coordinates)
  # end
  
  # def cost
  #   @_cost ||= 8 + distance * 3
  # end
end
