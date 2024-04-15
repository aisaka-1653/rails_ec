# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
  belongs_to :promotion_code, optional: true, dependent: :destroy

  def total_price
    cart_items.includes(:product).sum(&:subtotal) - (promotion_code&.amount || 0)
  end
end
