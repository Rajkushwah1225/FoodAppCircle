class RemoveRestaurantIdfromCuisines < ActiveRecord::Migration[7.0]
  def change
    remove_column :cuisines, :restaurant_id, :integer
    remove_column :cuisines, :description, :string
    remove_column :cuisines, :cart_id, :integer
    remove_column :cuisines, :price, :integer
    remove_column :cuisines, :cuisine_type, :string    
  end
end
