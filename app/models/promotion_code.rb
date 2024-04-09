class PromotionCode < ApplicationRecord
  has_many :carts

  validates :code, uniqueness: { case_sensitive: true }
  validates :code, :amount, presence: true
end
