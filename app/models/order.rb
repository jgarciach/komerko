class Order < ActiveRecord::Base
  attr_accessible :order_type, :guest, :email, :first_name, :last_name

  belongs_to :user
  
  has_many :order_items
  has_many :items, through: :order_items

  def transfer_cart_items(cart_items)
      #Converts cart items into order items
      cart_items.each do |cart_item|
          item = cart_item.item
          OrderItem.create(item_id: item.id, order_id: id, price_paid_per_unit: item.price, quantity: cart_item.quantity)
          #Item no longer in cart after "transfer"
          cart_item.destroy
      end
  end

end
