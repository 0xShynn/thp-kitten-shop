class ItemsController < ApplicationController

  def index 
    @items = Item.all
  end

  def show
    @item = Item.friendly.find(params[:id])
  end

  private

  def to_param
    @item = Item.friendly.find(params[:id])
  end

end 