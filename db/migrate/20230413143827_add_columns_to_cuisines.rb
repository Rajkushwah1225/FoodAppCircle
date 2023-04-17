class AddColumnsToCuisines < ActiveRecord::Migration[7.0]
  def change
    add_column :cuisines, :description, :string
    add_column :cuisines, :price, :integer
    add_column :cuisines, :cuisine_type, :string
    
  end
end
