class OrderItem < ActiveRecord::Base
  attr_accessible :item_id, :order_id, :price_paid_per_unit, :quantity
  
  belongs_to :order
  belongs_to :item  

  def self.transfer_cart_items_into_order(cart_items, order_id)
    #Converts cart items into order items
    cart_items.each do |cart_item|
      item = cart_item.item
      OrderItem.create(item_id: item.id, order_id: order_id, price_paid_per_unit: item.price, quantity: cart_item.quantity)
      #Item no longer in cart after "transfer"
      cart_item.destroy
    end
  end
end
