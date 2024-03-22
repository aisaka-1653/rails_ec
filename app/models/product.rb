class Product < ApplicationRecord
  has_one_attached :image
  validates :name, :content, :price, presence: true
end
