module CartsHelper
  def cart_items_count
    current_cart.cart_items.count
  end
end
