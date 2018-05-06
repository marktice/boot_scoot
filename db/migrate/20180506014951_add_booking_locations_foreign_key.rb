class AddBookingLocationsForeignKey < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :bookings, :locations, column: :origin_id,   primary_key: :id
    add_foreign_key :bookings, :locations, column: :destination_id,   primary_key: :id
  end
end
