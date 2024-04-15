# frozen_string_literal: true

class PromotionCode < ApplicationRecord
  has_many :carts, dependent: :nullify

  validates :code, uniqueness: { case_sensitive: true }
  validates :code, :amount, presence: true
end
