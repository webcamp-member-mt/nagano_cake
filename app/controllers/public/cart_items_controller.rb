class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end

  def update
    @cart_item = current_customer.cart_items.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to cart_items_path
    else
      redirect_to root_path
      # render :index
    end
  end

  def create
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @amount = @cart_item.amount + params[:cart_item][:amount].to_i
      @cart_item.update(amount: @amount)
      redirect_to cart_items_path
    else
      @cart_item = current_customer.cart_items.new(cart_item_params)
      if @cart_item.save
        redirect_to cart_items_path
      else
        redirect_to root_path
        # @cart_items_index = CartItem.all
        # render :index
      end
    end
  end

  def destroy
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to root_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
