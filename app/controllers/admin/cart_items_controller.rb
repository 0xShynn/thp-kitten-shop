class Admin::CartItemsController < ApplicationController

  def destroy
    @cart_item = CartItem.find(params[:id])
    @order = Order.find_by(cart_id: @cart_item.cart.id)
    flash[:success] = "L'article n° #{@cart_item.id} a bien été supprimé !"
    @cart_item.destroy
    redirect_to edit_admin_order_path(@order)
  end

end