class Admin::DashboardController < ApplicationController
  before_action :admin_login_required
  before_action :roll_check_shop_admin_or_higher, only: [:index, :edit, :update]
  before_action :roll_check_admin_or_higher, only: [:new]


  def index
    if is_shop_admin
      redirect_to shop_login_admin_dashboard_index_path
    end
  end

  def shop_login
    @shop_admins = ShopAdmin.where(admins_id: current_admin.id)
    @shops = @shop_admins.map { |shop_admin| Shop.find_by(id: shop_admin.shop_id) }.compact
  end

  private
end
