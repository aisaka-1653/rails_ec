class Admin::ProductsController < ApplicationController
  before_action :basic_auth

  def index
    @products = Product.order(:id)
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
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
    @product = Product.find(params[:id])
    @product.update!(product_params)
    redirect_to admin_products_url, notice: "｢#{@product.name}｣を更新しました｡"
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_url, notice: "｢#{@product.name}｣を削除しました｡"
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == 'pw'
    end
  end

  def product_params
    params.require(:product).permit(:name, :content, :price, :image)
  end
end
