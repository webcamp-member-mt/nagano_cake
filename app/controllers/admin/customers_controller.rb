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

  def update
    @customer_show = Customer.find(params[:id])
    if @customer_show.update(customer_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to admin_customer_path
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
  end
end
