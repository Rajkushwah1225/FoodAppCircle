class AddCartIdToCuisines < ActiveRecord::Migration[7.0]
  def change
   add_column :cuisines, :cart_id, :integer 
  end
end
