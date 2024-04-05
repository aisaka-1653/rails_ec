class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to root_path, notice: "購入ありがとうございます"
    else
      @cart_items = current_cart.cart_items
      render "carts/show", status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit!
  end
end
