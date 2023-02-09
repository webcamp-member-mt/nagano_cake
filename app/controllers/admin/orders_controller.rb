class Admin::OrdersController < ApplicationController
  def show
    @order_show = Order.find(params[:id])
    @customer_show = @order_show.customer
    @order_details = @order_show.order_detail
  end

  def update
    @order_show = Order.find(params[:id])
    if @order_show.update(order_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to admin_order_path
    else
    render :show
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status, :create_at, :updated_at)
  end

end
