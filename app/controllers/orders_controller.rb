class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @order = Order.find(params[:id])
    @cart_items = CartItem.where(cart_id: @order.cart_id)
  end

  def new
    @order = Order.new
    @cart = @order.find_current_user_cart(current_user)
    @cart_items = @order.find_cart_items_of_the_cart(@cart)
    @order.total = @order.total_amount_order(@cart_items)

  end

  def create
    @order = Order.new
    @cart = @order.find_current_user_cart(current_user)
    @cart_items = @order.find_cart_items_of_the_cart(@cart)
    @order.total = @order.total_amount_order(@cart_items)
    
    # Amount in cents
    @amount = (@order.total*100).to_i

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

  @order.cart = @cart
  @order.user = current_user
  
 if @order.save
      flash[:success] = "Ta commande a bien été payée ! Tu peux la retrouver dans ton profil :) "
      @cart.is_ordered = true 
      @cart.save 
      new_cart = @order.attribute_new_cart_to_user(current_user)
      new_cart.save
      redirect_to root_path
    else
      flash[:error] = "Ta commande n'a pas été validée :( Réessaie !"
      render :new
  end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to @cart 

  end # End create

end # End class
