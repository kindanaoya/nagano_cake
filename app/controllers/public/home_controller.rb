class Public::HomeController < ApplicationController
  def index
     @item = Item.new
      @genres = Genre.all
      true_genres = @genres.pluck(:id)
  	  @items = Item.where(is_active: true, genre_id: true_genres)
  end

  def show
      @item = Item.find(params[:id])
      @cart_item = CartItem.new
      @genres = Genre.where(is_active: true)
  end

    private
  def item_params
  	  params.require(:item).permit(:name, :introduction, :image_id, :is_active, :price,:genre_id)
  end
end
