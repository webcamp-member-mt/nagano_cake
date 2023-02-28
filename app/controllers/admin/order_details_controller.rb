class Admin::OrderDetailsController < ApplicationController
  def update
    @order_details = OrderDetail.find(params[:id])
    if @order_details.update(order_detail_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to admin_items_path
    else
      redirect_to admin_root_path
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :status)
  end


end
