class Order < ApplicationRecord
  has_many :order_detail, dependent: :destroy

  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :user_name, format: {
      with: /\A\w+\z/i,
      message: "は英数字のみ有効です"
    }
    validates :email, format: {
      with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
      message: "の値が不正です"
    }
    validates :zip_code, format: {
      with: /\A\d{7}\z/,
      message: "は7桁の数字のみ有効です"
    }
    validates :country
    validates :state
    validates :primary_address
    validates :secondary_address
    validates :credit_name, format: {
      with: /\A[a-z]+\s?[a-z]+\z/i,
      message: "は英文字のみ有効です"
    }
    validates :credit_number, format: {
      with: /\A\d{4}(?: \d{4}){3}\z/,
      message: "は16桁の数字のみ有効です"
    }
    validates :credit_expiration, format: {
      with: /\A\d{2}\/\d{2}\z/,
      message: "はMM/YYの形式のみ有効です"
    }
    validates :credit_cvv,format: {
      with: /\A\d{3,4}\z/,
      message: "は3~4桁の数字のみ有効です"
    }
  end
end
