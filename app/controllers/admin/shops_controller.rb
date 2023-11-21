class Admin::ShopsController < ApplicationController
before_action :admin_login_required
before_action :check_shop_admin, only: [:edit, :update]
before_action :roll_check_admin_or_higher, only: [:index, :new, :create, :destroy, :search]

  def index
    @shops = Shop.all.order(updated_at: :desc)
  end

  def show
    @shop = Shop.find(params[:id])
    unless @shop
      redirect_to admin_shops_path(@shop)
    end
  end

  def new
    @shop = Shop.new
    @shop_categories = ShopCategory.all()
    @shop_primary_categories = []
    @shop_secondary_categories = []
    @shop_categories.each do |shop_category|
      if shop_category.parent_id.nil?
        # 親IDがないものが第一カテゴリ
        @shop_primary_categories.push(["#{shop_category.name}", shop_category.id])
      else
        @shop_secondary_categories.push(["#{shop_category.name}", shop_category.id])
      end
    end
  end

  def create
    @shop = Shop.new(shop_params)

    if @shop.save
      redirect_to admin_shops_path, flash: { success: "ショップ「#{@shop.official_name}」を登録しました。" }
    else
      render :new
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])

    if @shop.update(shop_params)
      redirect_to edit_admin_shop_path(@shop), flash: { success: "ショップ「#{@shop.official_name}」を更新しました。" }
    else
      render :edit
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy

    redirect_to admin_shops_path, flash: { success: "ショップ「#{@shop.official_name}」を削除しました。" }
  end

  def search
    @shops = Shop.search(params[:keyword])
    @search_word = params[:keyword]
  end

  def auth
    @shop = Shop.find(params[:id])
    @shop_admins = ShopAdmin.where(shop_id: @shop.id)
    @role_users = []
    @shop_admins.each do |shop_admin|
      admin = Admin.find(shop_admin.admins_id)
      if admin
        @role_users << admin
      end
    end
  end

  def auth_confirm
    @shop = Shop.find(params[:id])
    @admin = Admin.find_by(email: params[:email])
    @shop_admin = ShopAdmin.new
    @search_word = params[:email]
    if !@admin or ["admin", "super_admin"].include?(@admin&.role)
      # 管理者は既に権限があるので検索から省く
      redirect_to auth_admin_shop_path(@shop), flash: { warning: "ユーザーが見つかりませんでした。" }
    end
  end


  private
  def shop_params
    params.require(:shop).permit(:official_name, :kana_name, :description, :primary_category, :secondary_category, :tel, :fax, :email, :address)
  end
end
