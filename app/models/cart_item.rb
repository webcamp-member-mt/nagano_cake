class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def line_total
   item.add_tax_price * amount
  end
end