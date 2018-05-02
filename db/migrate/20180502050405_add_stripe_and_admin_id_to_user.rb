class AddStripeAndAdminIdToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :stripe_charge_id, :string
    add_column :users, :admin, :boolean, default: false
  end
end
