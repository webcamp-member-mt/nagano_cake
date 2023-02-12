class Public::CartItemsController < ApplicationController
  def index
    @cart_items_index = CartItem.all
  end

  # def update
  #   @item_show = Item.find(params[:id])
  #   if @item_show.update(item_params)
  #     flash[:notice] = "You have updated book successfully."
  #     redirect_to cart_items_path
  #   else
  #     render :index
  #   end
  # end

  def create
    @cart_item_new = CartItem.new(cart_item_params)
    @cart_item_new.customer_id = current_customer.id
    if @cart_item_new.save
      redirect_to cart_items_path
    else
      @cart_items_index = CartItem.all
      render :index
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :create_at, :updated_at)
  end
end
