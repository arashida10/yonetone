class Shop < ApplicationRecord
  before_create -> { self.id = SecureRandom.uuid }

  has_many :products
  has_many :shop_categories
  has_many :shop_admins
  belongs_to :area, primary_key: :id, foreign_key: :area_id

  # ファイル保存
  has_many_attached :images

  validates :official_name, presence: true
  # validates :kana_name, presence: true, format: { with: /\A[\p{katakana}\u{30fc}]+\z/, message: "ひらがなで入力ください。" }

  # def self.search(keyword)
  #   if keyword
  #     Shop.where(['official_name LIKE ?', "%#{keyword}%"])
  #   else
  #     Shop.all
  #   end
  # end
end
