class PromotionCodesController < ApplicationController
  before_action :set_promotion_code, only: [:apply]

  def apply
    if current_cart.promotion_code
      flash[:error] = '適用できるプロモーションコードは1つです'
    elsif @promotion_code
      current_cart.update(promotion_code: @promotion_code)
    else
      flash[:error] = '入力されたプロモーションコードは無効です'
    end
    redirect_to cart_url(current_cart)
  end

  def remove
    current_cart.update(promotion_code_id: nil)
    redirect_to cart_url(current_cart)
  end

  private

  def set_promotion_code
    @promotion_code = PromotionCode.find_by(code: params[:code])
  end
end
