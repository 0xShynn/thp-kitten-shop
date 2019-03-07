class UsersController < ApplicationController
  # before_action :authenticate_user!, only: [:show]
  
  def show
    @user = User.find(params[:id])
    @orders = Order.where(user_id: params[:id])
    puts '$' * 60
    puts params.inspect
  end

  def edit
    @user = current_user
  end

  def update
     @user = current_user
      if @user.update_attributes(user_params)
        redirect_to user_path
    else
      render 'edit'
    end
  end 

  private 

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

  def to_param
    @user = User.find(params[:id])
    edit_user_path(user)
  end 

end 