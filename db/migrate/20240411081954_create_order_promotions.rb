# frozen_string_literal: true

class CreateOrderPromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :order_promotions do |t|
      t.references :order, null: false, foreign_key: true
      t.string :code
      t.integer :amount

      t.timestamps
    end
  end
end
