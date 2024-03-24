class Admin::ProductsController < ApplicationController
  before_action :basic_auth

  def index
    @products = Product.order(:id)
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == 'pw'
    end
  end
end
