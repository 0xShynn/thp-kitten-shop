class OrdersController < ApplicationController
 
  def show
    @order = Order.find(params[:id])
    @cart = @order.cart

    @cart_items = CartItem.where(cart_id: @cart.id)
    
    @total = 0.00
    @cart_items.each do |cart_item|
      @total = cart_item.item.price + @total
    end
 @total.save
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
    redirect_to order_path(order)
  end
end
