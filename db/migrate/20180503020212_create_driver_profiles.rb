class CreateDriverProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :driver_profiles do |t|
      t.references :user, foreign_key: true
      t.string :drivers_licence
      t.string :transport_type
      t.text :transport_image_data
      t.boolean :approved, default: false
      t.datetime :approved_at

      t.timestamps
    end
  end
end