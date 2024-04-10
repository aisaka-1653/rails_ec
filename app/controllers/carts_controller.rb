# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart_item, only: %i[create destroy]
  before_action :cart_items?, only: %i[show]

  def show
    @order = Order.new
    @cart_items = current_cart.cart_items.includes(:product)
    @promotion_code = current_cart.promotion_code
  end

  def create
    if @cart_item
      @cart_item.quantity += params[:quantity].to_i
      @cart_item.save
    else
      @cart_item = current_cart.cart_items.create(product_id: params[:product_id], quantity: params[:quantity])
    end
    redirect_to request.referer || root_path
  end

  def destroy
    @cart_item.destroy
    redirect_to request.referer || root_path
  end

  private

  def set_cart_item
    @cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
  end

  def cart_items?
    return unless current_cart.cart_items.empty?

    redirect_to root_url, alert: 'カートに商品を追加して下さい'
  end
end
