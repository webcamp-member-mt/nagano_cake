class Admin::CustomersController < ApplicationController
  def index
    @customers_index = Customer.all
  end

  def show
     @customer_show = Customer.find(params[:id])
  end

  def edit
     @customer_show = Customer.find(params[:id])
  end
  
  private

  def customer_params
    params.require(:customer).permit(:item_image, :name, :introduction, :price, :is_active, :create_at, :updated_at)
  end
end
