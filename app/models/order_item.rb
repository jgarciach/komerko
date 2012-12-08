class OrderItem < ActiveRecord::Base
  attr_accessible :item_id, :order_id, :price_paid_per_unit, :quantity
  
  belongs_to :order
  belongs_to :item  

  def self.create_order_items(order_id, cart_items)
    cart_items.each do |cart_item|
      item = cart_item.item
      OrderItem.create(item_id: item.id, order_id: order_id, price_paid_per_unit: item.price, quantity: cart_item.quantity)
    end
  end
end
