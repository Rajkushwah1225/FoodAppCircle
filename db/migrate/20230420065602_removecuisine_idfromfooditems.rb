class RemovecuisineIdfromfooditems < ActiveRecord::Migration[7.0]
  def change
    remove_column :fooditems, :cuisine_id, :integer
  end
end
