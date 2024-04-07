# frozen_string_literal: true

module Admin
  class OrdersController < ApplicationController
    include BasicAuthenticatable

    def index
      @orders = Order.includes(:order_details).order(created_at: :desc)
    end

    def show
      @order = Order.find(params[:id])
      @order_details = @order.order_details
    end
  end
end
