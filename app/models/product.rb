# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image
  validates :name, :content, :price, presence: true
  validates :price, numericality: { only_integer: true }
end
