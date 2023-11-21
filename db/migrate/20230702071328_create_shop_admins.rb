class CreateShopAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_admins do |t|
      t.references :admins, foreign_key: true, type: :string
      t.references :shop, foreign_key: true, type: :string
      t.string :role, null: false, default: ""

      t.timestamps
    end
  end
end
