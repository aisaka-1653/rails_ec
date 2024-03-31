# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart_item, only: %i[create destroy]

  def show
    @cart_items = current_cart.cart_items
    @order = Order.new
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
end
