class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :reviewee
      t.references :reviewer
      t.references :booking, foreign_key: true
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
