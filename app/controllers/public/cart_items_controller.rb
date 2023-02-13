class Public::CartItemsController < ApplicationController
  def index
    @cart_items_index = CartItem.all
  end

  def update
    @cart_item_show = CartItem.find(params[:id])
    if @cart_item_show.update(cart_item_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to items_path
    else
      redirect_to root_path
      # render :index
    end
  end

  def create
    @cart_item_new = CartItem.new(cart_item_params)
    @cart_item_new.customer_id = current_customer.id
    if @cart_item_new.save
      redirect_to cart_items_path
    else
      redirect_to root_path
      # @cart_items_index = CartItem.all
      # render :index
    end
  end

  def destroy
    @cart_item_show = CartItem.find(params[:id])
    @cart_item_show.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items_index = CartItem.all
    @cart_item_index.destroy
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
