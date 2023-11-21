class CreateAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :areas do |t|
      t.string :name

      t.timestamps
    end

    add_index :areas, :area_id
  end
end
