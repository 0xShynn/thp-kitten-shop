class CartItemsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    puts params.inspect
  end


  def create
    puts params.inspect
    cart = Cart.where(user_id: current_user.id).last
     if params[:cart_item].blank? 
       quantity = 1
     else
       quantity = params[:cart_item][:quantity]
     end
    cart_item = CartItem.new(cart_item_params)
    cart_item.quantity = quantity
    cart_item.save
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
