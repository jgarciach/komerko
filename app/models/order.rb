class Order < ActiveRecord::Base
  attr_accessible :order_type, :guest, :email, :first_name, :last_name

  belongs_to :user
  
  has_many :order_items
  has_many :items, through: :order_items
  belongs_to :address 

  def transfer_cart_items(cart_items)
      #Converts cart items into order items
      cart_items.each do |cart_item|
          item = cart_item.item
          OrderItem.create(item_id: item.id, order_id: id, price_paid_per_unit: item.price, quantity: cart_item.quantity)
          #Item no longer in cart after "transfer"
          cart_item.destroy
      end
  end

  def assign_user(uid)
    #Replaces contact fields and sets user reference
    self.user_id = uid
    update_attributes(email: nil, first_name: nil, last_name: nil)
  end
  
  #Attribute delegation to user 
  def first_name
    if user
        user.first_name
    else
        read_attribute(:first_name)
    end
  end
  
  def last_name
    if user
        user.last_name
    else
        read_attribute(:last_name)
    end
  end

  def email 
    if user
        user.email
    else
        read_attribute(:email)
    end
  end
end
