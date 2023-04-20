class RemoveCuisineIdfromcarts < ActiveRecord::Migration[7.0]
  def change
    remove_column :carts, :cuisine_id , :integer
  end
end
