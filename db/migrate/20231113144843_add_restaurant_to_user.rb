class AddRestaurantToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :restaurant_id, :string
  end
end
