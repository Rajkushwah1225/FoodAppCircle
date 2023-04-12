class AddCuisineIdToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :cuisine_id, :integer
  end
end
