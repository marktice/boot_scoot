class Booking < ApplicationRecord
  belongs_to :passenger,    class_name: 'User'
  belongs_to :driver,       class_name: 'User', optional: true

  belongs_to :origin,       class_name: 'Location', foreign_key: 'origin_id'
  belongs_to :destination,  class_name: 'Location', foreign_key: 'destination_id'
end
