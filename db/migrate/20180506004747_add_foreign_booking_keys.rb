class AddForeignBookingKeys < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :bookings, :users, column: :passenger_id,   primary_key: :id
    add_foreign_key :bookings, :users, column: :driver_id,      primary_key: :id
  end
end
