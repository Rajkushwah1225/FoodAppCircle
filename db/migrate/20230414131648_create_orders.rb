class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :cart_id
      t.integer :user_id
      t.string :restaurant_address
      

      t.timestamps
    end
  end
end
