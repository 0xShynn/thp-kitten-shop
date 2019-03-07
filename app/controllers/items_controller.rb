class ItemsController < ApplicationController

  def index 
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def to_param
    @item = Item.find(params[:id])
  end

end 