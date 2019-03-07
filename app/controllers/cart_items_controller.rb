class CartItemsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    puts params.inspect
  end

  def new 
    @cart_item = CartItem.new
  end

  def create
    cart = Cart.where(user_id: current_user.id).last
    cart_item = CartItem.create(cart_item_params)
    redirect_to user_cart_path(current_user, cart)
  end

  def destroy
    @cart_item = CartItem.find(params[:cart_item_id])
    @cart_item.destroy 
    redirect_to user_cart_path(Cart.find_by(user_id: current_user.id))
    
  end

  private

  def cart_item_params
    params.permit(:item_id, :cart_id)
  end

end
