class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :index
      #remove_column :restaurants, :cuisine_id , :integer
      add_column :restaurants, :fooditem_id , :integer
      t.timestamps
    end
  end
end
