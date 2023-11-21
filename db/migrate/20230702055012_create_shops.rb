class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops, id: false do |t|
      t.string :id, limit: 36, null: false, index: true,  primary_key: true
      t.string :official_name, null: false, default: ""
      t.string :kana_name
      t.string :description
      t.integer :primary_category, null: false, default: 1
      t.integer :secondary_category, null: false, default: ""
      t.string :tel
      t.string :fax
      t.string :email
      t.string :address
      t.string :status, null: false, default: 'draft'

      t.timestamps
    end
  end
end
