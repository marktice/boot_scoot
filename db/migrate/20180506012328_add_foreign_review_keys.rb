class AddForeignReviewKeys < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :reviews, :users, column: :reviewee_id,   primary_key: :id
    add_foreign_key :reviews, :users, column: :reviewer_id,   primary_key: :id
  end
end
