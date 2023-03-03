class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_detail
    @order_details = @order.order_detail.all

  end

  def update

    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    if @order.update(order_params)
      @order_details.update_all(status: 1) if @order.status == "payment_confirmation"
      flash[:notice] = "You have updated book successfully."
      redirect_to admin_order_path(@order)
    else
    render :show
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status, :create_at, :updated_at)
  end

end
