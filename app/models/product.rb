# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image
  has_many :item_carts, dependent: :destroy
  has_many :carts, through: :cart_items
  validates :name, :content, :price, presence: true
  validates :price, numericality: { only_integer: true }
end
