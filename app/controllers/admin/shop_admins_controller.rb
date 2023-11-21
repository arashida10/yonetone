class Admin::ShopAdminsController < ApplicationController
  def index
    # ロジックを実装してください
  end

  def show
    # ロジックを実装してください
  end

  def new
    @shop_admin = ShopAdmin.new
  end

  def create
    @shop = Shop.find(shop_admin_params[:shop_id])
    @admin = Admin.find(shop_admin_params[:admins_id])
    @shop_admin = ShopAdmin.new(shop_admin_params)
    if @admin && !["admin", "super_admin"].include?(@admin&.role)
      if ShopAdmin.exists?(admins_id: @shop_admin.admins_id, shop_id: @shop_admin.shop_id)
        # 重複するデータが存在する場合の処理
        redirect_to auth_admin_shop_path(@shop), flash: { warning: "ユーザー「#{@admin.name}」は既に権限が追加されています。" }
      else
        if @shop_admin.save
          redirect_to auth_admin_shop_path(@shop), flash: { success: "ショップ「#{@shop.official_name}」にユーザー「#{@admin.name}」を登録しました。" }
        else
          redirect_to auth_admin_shop_path(@shop), flash: { warning: "権限を追加できませんでした。もう一度お試しください。" }
        end
      end
    else
      # ユーザーが見つからない場合
      redirect_to auth_admin_shop_path(@shop), flash: { warning: "ユーザーが見つかりませんでした。" }
    end
  end

  def edit
    # ロジックを実装してください
  end

  def update
    # ロジックを実装してください
  end

  def destroy
    # ロジックを実装してください
  end

  private
  def shop_admin_params
    params.require(:shop_admin).permit(:admins_id, :shop_id, :role)
  end
end
