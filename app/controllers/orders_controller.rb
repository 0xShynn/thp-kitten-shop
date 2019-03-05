class OrdersController < ApplicationController
 
  def show
    @order = Order.find(params[:id])

  end

  def new

  end

  def create
    cart = Cart.find(params[:cart_id])
    order = Order.new
    order.user_id = current_user.id 
    order.cart_id = cart.id
    
    order.save
    puts "Commande créée"
    # redirect_to order_path
  end
end
