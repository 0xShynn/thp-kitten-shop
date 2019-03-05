class OrdersController < ApplicationController
 
<<<<<<< HEAD
  def show
  end

  

=======
>>>>>>> 248a07ba762521ff027a07d8e6bef2ee628955fb
  def new
    @order = Order.new
    @cart = @order.find_current_user_cart(current_user)
    @cart_items = @order.find_cart_items_of_the_cart(@cart)
    @total = @order.total_amount_order(@cart_items)

  end

  def create
    @order = Order.new
    @cart = @order.find_current_user_cart(current_user)
    @cart_items = @order.find_cart_items_of_the_cart(@cart)
    @total = @order.total_amount_order(@cart_items)
    
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

<<<<<<< HEAD
    order.save
    
    redirect_to root_path
=======
  @order.cart = @cart
  @order.user = current_user
  
 if @order.save
      flash[:success] = "Ta commande a bien été payée ! Super"
      redirect_to root_path
    else
      flash[:error] = "Ta commande n'a pas été validée :("
      render :new
  end
>>>>>>> 248a07ba762521ff027a07d8e6bef2ee628955fb

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to @cart 

  end # End create

end # End class
