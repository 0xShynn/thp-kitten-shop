class CartItemsController < ApplicationController
  def show
    puts '$' * 60
    puts params.inspect
  end

  def new 
    @cart_item = CartItem.new
  end

  def create
    cart = Cart.find_by(user_id: current_user.id)
    cart_item = CartItem.create(cart_item_params)
    redirect_to cart_path(cart)
  end

  private

  def cart_item_params
    params.permit(:item_id, :cart_id)
  end

end
