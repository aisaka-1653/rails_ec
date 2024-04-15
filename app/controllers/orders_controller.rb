# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @cart_items = current_cart.cart_items.includes(:product)
    @promotion_code = current_cart.promotion_code

    if @order.save_with_details(current_cart)
      session.delete(:cart_id)
      OrderMailer.ordermail(@order).deliver_now
      redirect_to root_url, notice: '購入ありがとうございます'
    else
      flash.now[:error] = '注文が正常に行えませんでした'
      render 'carts/show', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit!
  end
end
