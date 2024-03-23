# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.order(:id)
  end

  def show
    @product = Product.find(params[:id])
    @products = Product.order(created_at: :desc).limit(4)
  end
end
