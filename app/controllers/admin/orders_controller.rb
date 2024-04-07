class Admin::OrdersController < ApplicationController
  include BasicAuthenticatable

  def index
    @orders = Order.includes(:order_details).order(created_at: :desc)
  end

  def show
  end
end
