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

  def destroy
    @cart_item = CartItem.find(params[:cart_item_id])
    @cart_item.destroy 
    redirect_to cart_path(Cart.find_by(user_id: current_user.id))
    
  end

  private

  def cart_item_params
    params.permit(:item_id, :cart_id)
  end

end
