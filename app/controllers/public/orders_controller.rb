class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  # before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @order = Order.new
  end

  def comfirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.shipping_cost = 800
    select_address = params[:order][:select_address]
    if select_address == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif select_address == "1"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
    @order_sending = Order.new
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      @order_details = current_customer.cart_items
      @order_details.each do |cart_item|
      order_detail =  OrderDetail.new(order_id: @order.id, item_id: cart_item.item_id, price: cart_item.item.price, amount: cart_item.amount, status: 0)
      order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to complete_orders_path
    else
      redirect_to root_path
    end
  end

  def index
    @orders = current_customer.orders
  end

  def show
    is_matching_login_user
    @order = Order.find(params[:id])
    @order_details = @order.order_detail
    @total = @order.total_payment-=@order.shipping_cost
  end


  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
  end

  def is_matching_login_user
    customer = Order.find(params[:id])
    unless customer.customer_id == current_customer.id
      redirect_to orders_path
    end
  end
end
