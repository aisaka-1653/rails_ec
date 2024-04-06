class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @cart_items = current_cart.cart_items.includes(:product)

    @order.transaction do
      if @order.save
        @cart_items.each do |cart_item|
          product = cart_item.product
          @order.order_details.create!(
            product_name: product.name,
            product_price: product.price,
            quantity: cart_item.quantity,
            subtotal: cart_item.subtotal
          )
        end
        redirect_to root_path, notice: "購入ありがとうございます"
      else
        render "carts/show", status: :unprocessable_entity
      end
    end
  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = "注文が正常に行えませんでした"
    render "carts/show", status: :unprocessable_entity
  end

  private

  def order_params
    params.require(:order).permit!
  end
end
