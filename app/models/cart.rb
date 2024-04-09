# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
  belongs_to :promotion_code, optional: true

  def total_price
    cart_items.includes(:product).sum(&:subtotal)
  end
end
