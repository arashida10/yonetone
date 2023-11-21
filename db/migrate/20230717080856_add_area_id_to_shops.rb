class AddAreaIdToShops < ActiveRecord::Migration[6.1]
  def change
    add_reference :shops, :area, foreign_key: true
  end
end
