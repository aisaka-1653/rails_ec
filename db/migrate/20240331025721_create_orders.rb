# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :user_name, null: false
      t.string :email, null: false
      t.string :zip_code, null: false
      t.string :country, null: false
      t.string :state, null: false
      t.string :primary_address, null: false
      t.string :secondary_address, null: false
      t.string :credit_name, null: false
      t.string :credit_number, null: false
      t.datetime :credit_expiration, null: false
      t.string :credit_cvv, null: false

      t.timestamps
    end
  end
end
