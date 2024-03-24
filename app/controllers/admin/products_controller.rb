class Admin::ProductsController < ApplicationController
  before_action :basic_auth
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.order(:id)
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_url, notice: "｢#{@product.name}｣を登録しました｡"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_url, notice: "｢#{@product.name}｣を更新しました｡"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_url, notice: "｢#{@product.name}｣を削除しました｡"
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def product_params
    params.require(:product).permit(:name, :content, :price, :image)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
