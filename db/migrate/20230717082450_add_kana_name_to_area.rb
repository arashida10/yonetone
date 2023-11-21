class AddKanaNameToArea < ActiveRecord::Migration[6.1]
  def change
    add_column :areas, :kana_name, :string
  end
end
