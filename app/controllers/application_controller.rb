# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_cart

  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
end
