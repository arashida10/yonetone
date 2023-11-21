class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @products = Product.where(shop_id: params[:id])
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)

    if @shop.save
      redirect_to "/shops/#{@shop.id}", notice: "ショップ「#{@shop.common_name}」を登録しました。"
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
      redirect_to "/shops/#{@shop.id}", notice: "ショップ「#{@shop.common_name}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy

    redirect_to "/", notice: "ショップ「#{@shop.common_name}」を削除しました。"
  end

  def search
    # @shops = Shop.search(params[:keyword])
    @shops = @q.result
    # @search_word = params[:keyword]
  end

  private

  def set_q
    @q = Shop.ransack(params[:q])
  end

  def shop_params
    params.require(:shop).permit(:common_name, :katakana_name, :description, :primary_category, :secondary_category, :tel, :fax, :email, :address)
  end
end
