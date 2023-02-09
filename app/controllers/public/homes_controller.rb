class Public::HomesController < ApplicationController
  def top
    @items_index = Item.all
  end

  def about
  end
end
