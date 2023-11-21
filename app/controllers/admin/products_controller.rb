class Admin::ProductsController < ApplicationController
  def index
    @shop = Shop.find(params[:shop_id])
    @products = Product.where(shop_id: params[:shop_id])
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @shop = Shop.find(params[:shop_id])
    @product = Product.new
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_shop_products_path
    else
      flash.now[:alert] = @product.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    # @shop = Shop.find(params[:shop_id])
  end

  def update
    @shop = Shop.find(params[:shop_id])
    @product = @shop.products.find(params[:id])
    if @product.update(product_params)
      redirect_to [:admin, @shop]
    else
      render :edit
    end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @product = @shop.products.find(params[:id])
    @product.destroy
    redirect_to [:admin, @shop]
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :shop_id)
  end
end
