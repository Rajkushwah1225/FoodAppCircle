class AddFooditemIdsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :fooditem_ids, :text
    add_column :orders, :address, :text
  end
end
