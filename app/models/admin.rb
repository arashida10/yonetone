class Admin < ApplicationRecord
  enum role: { super_admin: "super_admin", admin: "admin", shop_admin: "shop_admin", shipper: "shipper" }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
