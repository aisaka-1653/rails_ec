class RemoveOldProductColumnAndAddNewProductColumn < ActiveRecord::Migration[7.0]
  def up
    change_table :order_details do |t|
      t.remove :product_id
      t.string :product_name, null: false
      t.integer :product_price, null: false
      t.integer :subtotal, null: false
    end
  end
  def down
    change_table :order_details do |t|
      t.bigint :product_id
      t.remove :product_name
      t.remove :product_price
      t.remove :subtotal
    end
  end
end
