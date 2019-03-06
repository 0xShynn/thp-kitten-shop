class ItemsController < ApplicationController

    def index 
      @items = Item.all
    end

    def show
      @item = Item.find(params[:id])
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
        flash[:success]="Ton produit a bien ete ajoutee"
        saving_photo
        redirect_to item_path(@item.id)
      else
        flash.now[:error]="Ton produit n'a pas pu etre sauvegardee"
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

       if @item.update(post_params)
        @item.photo.attach(params[:photo])
        redirect_to @item
        flash[:success]= "Bravo"
       else
        render :edit
        flash[:danger]= "Ratee"
       end
      end

private

def post_params
  params.require(:item).permit(:name, :description, :price, :photo)
end 



end 