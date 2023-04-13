class RemoveCuisinenameFromFoodItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :fooditems, :cuisine_name
  end
end
