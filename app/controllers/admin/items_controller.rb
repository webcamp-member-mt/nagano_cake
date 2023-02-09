class Admin::ItemsController < ApplicationController
  def index
    @items_index = Item.all
  end

  def new
    @item_new = Item.new
  end

  def create
    @item_new = Item.new(item_params)
    if @item_new.save
      redirect_to admin_item_path(@item_new.id)
    else
      @item_new = Item.new
      render :new
    end
  end

  def show
    @item_show = Item.find(params[:id])
  end

  def edit
    @item_show = Item.find(params[:id])
  end

  def update
    @item_show = Item.find(params[:id])
    if @item_show.update(item_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to admin_item_path
    else
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:item_image, :name, :introduction, :price, :is_active, :create_at, :updated_at)
  end
end
