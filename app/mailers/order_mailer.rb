# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  # default from: "apparel_shop@example.jp"

  def ordermail(order)
    @order = order
    @order_details = order.order_details
    @order_promotion = order.order_promotion

    mail(to: @order.email, subject: 'Apparel Shop')
  end
end
