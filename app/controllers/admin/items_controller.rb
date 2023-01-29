class Admin::ItemsController < ApplicationController
  def index
    @items_index = Item.all
  end

  def new
    @item_new = Item.new
  end

  def create
    @item_new = Item.new(item_params)
    @item_new.save
    redirect_to new_admin_item_path

  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to admin_item_path
    else
      render :edit
    end
  end
end
