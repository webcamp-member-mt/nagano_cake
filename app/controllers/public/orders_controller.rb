class Public::OrdersController < ApplicationController
  def new
    @order_new = Order.new
  end

  def comfirm
  end

  def complete
  end

  def create
    @order_new = Order.new(order_params)
    @order_new.customer_id = current_customer.id
    if @order_new.save
      redirect_to orders_complete_path
    else
      redirect_to root_path
    end
  end

  def index
  end

  def show
  end


  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end
