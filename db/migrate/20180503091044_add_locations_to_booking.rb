class AddLocationsToBooking < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :origin
    add_reference :bookings, :destination
  end
end
