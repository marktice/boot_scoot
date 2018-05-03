class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :passenger
      t.references :driver
      t.string :origin_address
      t.string :destination_address
      t.decimal :distance
      t.decimal :cost
      t.string :status
      t.datetime :payed_at
      t.datetime :completed_at

      t.timestamps
    end
  end
end
