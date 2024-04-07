# frozen_string_literal: true

module Admin
  module OrdersHelper
    def purchased_items_count(order)
      order.order_details.count
    end
  end
end
