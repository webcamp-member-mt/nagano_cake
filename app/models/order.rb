class Order < ApplicationRecord
  has_many :order, dependent: :destroy
  belongs_to :customer
end
