module Admin::OrdersHelper
  def purchased_items_count(order)
    order.order_details.count
  end
end
