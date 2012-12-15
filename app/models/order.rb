class Order < ActiveRecord::Base
  attr_accessible :order_type, :email, :first_name, :last_name, :address_id, :business_id

  belongs_to :user
  belongs_to :address 
  belongs_to :business  

  has_many :order_items
  has_many :items, through: :order_items

  validates :address, presence: true, if: :for_delivery?
  validates :email, presence: true, if: :for_guest?

  #Sets user_id on orders with email == user_email
  def self.associate_orders_with_user(user_email, user_id)
    Order.where(email: user_email).each do |order|
        order.assign_user(user_id) 
    end
  end

  def for_delivery?
    order_type == "delivery"
  end

  def for_guest?
    user_id == nil
  end

  def total
    total = 0
    self.order_items.each do |o|
      total += (o.price_paid_per_unit*o.quantity)
    end
    total
  end
 
  def checkout(business, cart, current_user, user_info, address)
    set_user_or_contact_info(current_user, user_info)
    
    if for_delivery? 
      if address.valid?
        address.save
        self.address = address
      else
        return false
      end
    end

    if save 
      OrderItem.transfer_cart_items_into_order(cart.cart_items, self.id)
    else
      return false
    end
    
    return true
  end
  
  #Takes user object or info hash containing first_name, last_name and email
  def set_user_or_contact_info(user, user_info)
    if user
      self.user_id = user.id
    else
     self.first_name = user_info[:first_name]
     self.last_name  = user_info[:last_name]
     self.email      = user_info[:email]
    end
  end
  
  def assign_user(uid)
    #Replaces contact fields and sets user reference
    self.user_id = uid
    self.update_attributes(email: nil, first_name: nil, last_name: nil)
  end
  
  #Attribute delegation to user
  def delegate_to_user(attr_name)
    user ? user.read_attribute(attr_name) : read_attribute(attr_name)
  end

  def first_name
    delegate_to_user(:first_name)
  end
  
  def last_name
    delegate_to_user(:last_name)
  end

  def email 
    delegate_to_user(:email)
  end
end
