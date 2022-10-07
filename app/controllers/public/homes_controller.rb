class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @item1 = Item.first
    @item2 = Item.second
    @item3 = Item.third
    @item4 = Item.fourth
  end

  def about
  end
end
