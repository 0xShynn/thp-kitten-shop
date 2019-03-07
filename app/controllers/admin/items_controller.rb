class Admin::ItemsController < ApplicationController
  before_action :check_if_admin!

  def index 
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(
    name: params[:name], 
    price: params[:price], 
    description: params[:description])
  
    if @item.save
      flash[:success]="Ton produit a bien ete ajoutée"
      saving_photo
      redirect_to item_path(@item.to_param)
    else
      flash.now[:error]="Ton produit n'a pas pu etre sauvegardée"
      render :new  
    end
  end 

  def saving_photo
    @item = Item.find(@item.id)
    @item.photo.attach(params[:photo])
  end


  def edit
    @item = Item.find(params[:id])
  end 

  def update
    @item = Item.find(params[:id])
    # @item.photo.attach(params[:photo])
    
    if @item.update(post_params)
    redirect_to @item
    flash[:success]= "Bravo"
    else
    render :edit
    flash[:danger]= "Ratee"
    end
  end

  private

  def check_if_admin!
    if current_user.is_admin == false
      redirect_to root_path
    end
  end

  def post_params
    params.require(:item).permit(:name, :description, :price, :photo)
  end

end