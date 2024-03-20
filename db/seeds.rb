# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

20.times do |n|
  Product.create!(
    name: "Item#{n + 1}",
    content: "この商品はItem#{n + 1}です",
    price: rand(1000..2000),
    image: ActiveStorage::Blob.create_and_upload!(
      io: File.open(Rails.root.join("app/assets/images/products/item#{n + 1}.jpg")),
      filename: "item#{n + 1}.jpg")
  )
end
