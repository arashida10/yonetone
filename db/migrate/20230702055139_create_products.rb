class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false, default: ""
      t.text :description
      t.integer :price
      t.references :shop, foreign_key: true, type: :string

      t.timestamps
    end
  end
end

