class Product < ApplicationRecord
  belongs_to :shop, primary_key: :id, foreign_key: :shop_id
end
