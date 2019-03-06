class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  
  def show
    @user = User.find(params[:id])
  end

  def to_param
  @user = User.find(params[:id])
edit_user_path(user)
  end 

end 