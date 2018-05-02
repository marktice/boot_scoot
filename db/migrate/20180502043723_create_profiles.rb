class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :sex
      t.string :phone_number
      t.string :home_address
      t.decimal :latitude
      t.decimal :longitude
      t.text :avatar_image_data
      t.decimal :average_rating

      t.timestamps
    end
  end
end
