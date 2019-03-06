class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :is_my_cart!, only: [:show]
  before_action :already_ordered!, only: [:show]

  def show
    @cart = Cart.find(params[:id])

    @cart_items = CartItem.where(cart_id: params[:id])
    
    @total = 0.00
    @cart_items.each do |cart_item|
      @total = cart_item.item.price + @total
    end
  end

  private

  def is_my_cart!
    if Cart.find(params[:id]).user_id != current_user.id
      flash[:error] = "Dis donc petit malin ! On essaye de voir les paniers des autres ?"
      redirect_to root_path
    end
  end

  def already_ordered!
    @cart = Cart.find(params[:id])
    if @cart.is_ordered == true
      flash[:error] = "Tu as déjà commandé ce panier ! Pour le voir, va sur ton profil ! "
      redirect_to root_path
    end
  end
end
