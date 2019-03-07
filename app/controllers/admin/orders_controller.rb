class Admin::OrdersController < ApplicationController
  before_action :check_if_admin!

  def show
    @order = Order.find(params[:id])
    @cart_items = CartItem.where(cart_id: @order.cart_id)
  end

  def edit
    @order = Order.find(params[:id])
    @cart_items = CartItem.where(cart_id: @order.cart_id)
  end


  def destroy
    @order = Order.find(params[:id])
    flash[:success] = "La commande n° #{@order.id} a bien été supprimée"
    @order.destroy
    
    redirect_to admins_path
   
  end

  private

  def check_if_admin!
    if current_user.is_admin == false
      redirect_to root_path
    end
  end

end