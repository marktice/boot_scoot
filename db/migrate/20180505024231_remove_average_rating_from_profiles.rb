class RemoveAverageRatingFromProfiles < ActiveRecord::Migration[5.1]
  def change
    remove_column :profiles, :average_rating, :decminal
  end
end
