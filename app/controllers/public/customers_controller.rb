class Public::CustomersController < ApplicationController
  def show
    @customer_show = Customer.find(current_customer.id)
  end

  def edit
    @customer_show = Customer.find(current_customer.id)
  end

  def update
    @customer_show = Customer.find(current_customer.id)
    if @customer_show.update(customer_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to my_page_path
    else
      render :edit
    end
  end

  def unsubscribe
    @customer_show = Customer.find(current_customer.id)
  end


  private

  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted, :create_at, :updated_at)
  end
end
