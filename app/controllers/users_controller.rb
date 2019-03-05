class UsersController < ApplicationController
  # before_action :authenticate_user!, only: [:show]
  
  def show
    @user = User.find(params[:id])
    @orders = Order.where(user_id: params[:id])
    puts '$' * 60
    puts @orders
  end
end
