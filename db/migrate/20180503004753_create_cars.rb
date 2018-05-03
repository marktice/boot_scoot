class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.references :user, foreign_key: true
      t.string :make
      t.string :model
      t.string :number_plate
      t.string :transmission
      t.text :car_image_data

      t.timestamps
    end
  end
end
