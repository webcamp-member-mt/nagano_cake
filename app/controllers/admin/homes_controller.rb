class Admin::HomesController < ApplicationController
  def top
    @orders_index = Order.all
  end
end
