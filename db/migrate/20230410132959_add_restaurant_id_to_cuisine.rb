class AddRestaurantIdToCuisine < ActiveRecord::Migration[7.0]
  def change
    add_column :cuisines, :restaurant_id, :integer
  end
end
