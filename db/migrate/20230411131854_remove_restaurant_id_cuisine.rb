class RemoveRestaurantIdCuisine < ActiveRecord::Migration[7.0]
  def change
    remove_column :cuisines, :restaurant_id
  end
end
