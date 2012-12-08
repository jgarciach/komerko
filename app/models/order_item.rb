class OrderItem < ActiveRecord::Base
  attr_accessible :item_id, :order_id, :price_paid_per_unit, :quantity
  
  belongs_to :order
  belongs_to :item  
end
