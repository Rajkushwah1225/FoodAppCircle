class AddCuisineidToFooditems < ActiveRecord::Migration[7.0]
  def change
    add_column :fooditems, :cuisine_id, :integer
  end
end
