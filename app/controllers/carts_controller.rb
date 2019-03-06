class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @cart = Cart.find(params[:id])
    puts params.inspect
    @cart_items = CartItem.where(cart_id: params[:id])
    @total = 0.00
    @cart_items.each do |cart_item|
      @total = cart_item.item.price + @total
    end
  end

end
