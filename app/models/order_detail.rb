class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum status: { production_not_possible: 0, production_pending: 1, in_production: 2, production_complete: 3 }

  def add_tax_price
    (price * 1.10).floor
  end
  def line_total
   add_tax_price * amount
  end
end