class ItemsController < ApplicationController
  def index 
    @items = Item.all
    puts '$' * 60
    puts "Je suis l'utilisateur"
    puts current_user

  end

  def show
    @item = Item.find(params[:id])
  end
end
