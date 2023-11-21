class Admin::AdminsController < ApplicationController
  before_action :admin_login_required
  before_action :check_shop_admin, only: [:edit, :update]
  before_action :roll_check_admin_or_higher, only: [:index, :new, :create, :destroy, :search]

  def index
    @shop_admins = Admin.where(role: 'shop_admin')
  end

  def new
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def edit
    @admin = Admin.find(params[:id])
  end
end
