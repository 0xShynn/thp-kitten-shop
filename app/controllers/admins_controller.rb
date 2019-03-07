class AdminsController < ApplicationController

  def index
    @orders = Order.all
    @users = User.all
  end
end