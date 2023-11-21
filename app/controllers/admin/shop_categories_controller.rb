class Admin::ShopCategoriesController < ApplicationController
  def index
    @shop_categories = ShopCategories.all
  end

  def new
    @shop_category = ShopCategories.new
  end

  def create
    @shop_category = ShopCategories.new(shop_category_params)

    if @shop_category.save
      redirect_to "/shop_categories/#{@shop_category.id}", notice: "ショップ「#{@shop_category.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
    @shop_category = ShopCategories.find(params[:id])
    @shop_categories = ShopCategories.all()
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

  def update
    @shop_category = ShopCategories.find(params[:id])

    if @shop_category.update(shop_category_params)
      redirect_to "/admin/shop_categories", notice: "ショップ「#{@shop_category.name}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @shop_category = ShopCategories.find(params[:id])
    @shop_category.destroy

    redirect_to "/", notice: "ショップ「#{@shop_category.common_name}」を削除しました。"
  end

  private

  def shop_category_params
    params.require(:shop_categories).permit(:name, :slug, :parent_id)
  end
end
