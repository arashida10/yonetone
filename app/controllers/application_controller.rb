class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_shop
  helper_method :is_super_admin
  helper_method :is_admin
  helper_method :auth_check_admin_or_higher

  # deviceカラム追加
  before_action :configure_permitted_parameters, if: :devise_controller?

  def self.ransackable_attributes(auth_object = nil)
    ['official_name', 'other_allowed_attribute']
  end
  # ransack共通で使う
  before_action :set_search

  def set_search
    @search = Shop.ransack(params[:q])
    @shops = @search.result
  end

  # 例外処理
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404

  def render_404
    render file: Rails.public_path.join('404.html'), status: 404, layout: 'application', content_type: 'text/html'
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :roll])
  end

  private
  def current_admin
    @current_admin ||= warden.authenticate(scope: :admin)
  end

  def current_user
    @current_user ||= warden.authenticate(scope: :user)
  end

  def current_shop
    @current_shop ||= Shop.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    raise ActionController::RoutingError, 'Not Found'
  end


  def current_user_shops
    @current_user_shops ||= params[:id] ? UserShop.where(shop_id: params[:id]) : nil
  end

  # admin以上
  def roll_check_admin_or_higher
    unless is_super_admin || is_admin
      render_404
    end
  end
  # shop_admin以上
  def roll_check_shop_admin_or_higher
    unless is_super_admin || is_admin || is_shop_admin
      render_404
    end
  end

  # 権限チェック

  # shop_admin ショップの編集権限チェック
  def check_shop_admin
    if ['super_admin', 'admin'].include?(current_admin.role)
      return true
    end
    @current_shop_admin ||= ShopAdmin.find_by(shop_id: current_shop.id, admins_id: current_admin.id)
    unless @current_shop_admin
      render_404
    end
  end

  # is_
  def is_super_admin
    return false unless current_admin
    return false if current_admin.role != 'super_admin'
    true
  end
  def is_admin
    return false unless current_admin
    return false if current_admin.role != 'admin'
    true
  end
  def is_delivery_staff
    return false unless current_admin
    return false if current_admin.role != 'delivery_staff'
    true
  end
  def is_shop_admin
    return false unless current_admin
    return false if current_admin.role != 'shop_admin'
    true
  end

  # ログイン必須
  def admin_login_required
    redirect_to new_admin_session_path unless current_admin
  end
  def user_login_required
    redirect_to new_user_session_path unless current_user
  end
end
