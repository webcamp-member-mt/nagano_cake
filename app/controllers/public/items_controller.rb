class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
    @items_count = Item.count
  end

  def show
    @item_show = Item.find(params[:id])
    @cart_item_new = CartItem.new
  end




  private

  def item_params
    params.require(:item).permit(:item_image, :name, :introduction, :price, :is_active)
  end
end
