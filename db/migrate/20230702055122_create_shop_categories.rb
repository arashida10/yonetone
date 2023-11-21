class CreateShopCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_categories do |t|
      t.string :name, null: false, default: ""
      t.string :slug, null: false, default: ""
      t.integer :parent_id
      t.references :shop, foreign_key: true, type: :string

      t.timestamps
    end
  end
end
