class OrdersController < ApplicationController
 
  def show
  end

  

  def new
    @order = Order.new
    @cart = Cart.find_by(user: current_user)
    @cart_items = CartItem.where(cart_id: @cart.id)
  
    @total = 0.00
    @cart_items.each do |cart_item|
      @total = cart_item.item.price + @total
    end

  end

  def create
    cart = Cart.find_by(user: current_user)
    order = Order.new
    order.user_id = current_user.id 
    order.cart_id = cart.id
    @cart_items = CartItem.where(cart_id: cart.id)
    @total = 0.00
    @cart_items.each do |cart_item|
      @total = cart_item.item.price + @total
    end
    
    # Amount in cents
    @amount = (@total*100).to_i

        customer = Stripe::Customer.create({
          email: params[:stripeEmail],
          source: params[:stripeToken],
        })
    
        charge = Stripe::Charge.create({
          customer: customer.id,
          amount: @amount,
          description: 'Rails Stripe customer',
          currency: 'eur',
        })    

    order.save
    
    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to cart 
  end
end
