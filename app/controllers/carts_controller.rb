class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :index, :show]

  def index
  end

  def show
    puts '$' * 60
    puts params.inspect
    @cart_items = CartItem.where(cart_id: params[:id])
    @total = 0.00
    @cart_items.each do |cart_item|
      @total = cart_item.item.price + @total
    end
  end

  def new
  end

  def create
  #   # Amount in cents
  #   @amount = @total

  #   customer = Stripe::Customer.create({
  #     email: params[:stripeEmail],
  #     source: params[:stripeToken],
  #   })

  #   charge = Stripe::Charge.create({
  #     customer: customer.id,
  #     amount: @amount,
  #     description: 'Rails Stripe customer',
  #     currency: 'eur',
  #   })

  # rescue Stripe::CardError => e
  #   flash[:error] = e.message
  #   redirect_to @cart
  end

end
