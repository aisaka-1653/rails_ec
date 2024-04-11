# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_one :order_promotion, dependent: :destroy

  validates :first_name, :last_name, :user_name, :email, :zip_code, :country, :state,
            :primary_address, :secondary_address, :credit_name, :credit_number,
            :credit_expiration, :credit_cvv, presence: true

  validates :user_name, format: { with: /\A\w+\z/i }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :zip_code, format: { with: /\A\d{7}\z/ }
  validates :credit_name, format: { with: /\A[a-z]+\s?[a-z]+\z/i }
  validates :credit_number, format: { with: /\A\d{4}(?: \d{4}){3}\z/ }
  validates :credit_cvv, format: { with: /\A\d{3,4}\z/ }

  def credit_expiration=(value)
    return unless value.match?(%r{\A\d{2}/\d{2}\z})

    self[:credit_expiration] = Date.strptime(value, '%m/%y').end_of_month
  end

  def total_price
    order_details.sum(&:subtotal)
  end

  def save_with_details(cart)
    ApplicationRecord.transaction do
      save!
      cart.cart_items.includes(:product).find_each do |cart_item|
        product = cart_item.product
        order_details.create!(
          product_name: product.name,
          product_price: product.price,
          quantity: cart_item.quantity,
          subtotal: cart_item.subtotal
        )
      end
      cart.destroy!
    end
    true
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotDestroyed
    false
  end
end
