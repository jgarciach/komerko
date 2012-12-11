class Cart < ActiveRecord::Base
  attr_accessible  :business_id, :user_id

  has_many :cart_items
  has_many :items, through: :cart_items
  belongs_to :user
  belongs_to :business

  def total
    total = 0
    self.cart_items.each do |cart_item|
      item = cart_item.item
      total = total + (item.price*cart_item.quantity)
    end
    total
  end

  #Changes cart_items' references from cart_id to id and destroys
  #cart with id == cart_id
  def transfer_cart_items_from!(cart_id)
    imposter = Cart.find(cart_id)
    imposter.cart_items.each do |citem|
        citem.update_attributes(cart_id: id)
    end
    imposter.destroy
  end
  
  #Merges cart_items from new_carts_hash into user.carts 
  def self.assign_carts_to_user(user, new_carts_hash)
    new_carts_hash.each do |business_id, cart_id|
      #for every business_id in hash, look for user carts
      existing_cart = Cart.where(user_id: user.id, business_id: business_id).first
      if existing_cart
        #If the user already has a cart with that business, 
        #transfer items from the cart created while he was a guest
        existing_cart.transfer_cart_items_from!(cart_id)
        #Replace cart in hash
        new_carts_hash[business_id] = existing_cart.id
      else
        #Else, assign the orphan cart to this user.
        new_cart = Cart.find(cart_id)
        new_cart.update_attributes(user_id: user.id)
      end
    end
    new_carts_hash
  end

  #Counts number of items in cart
  def number_of_items
    items = 0
    self.cart_items.each do |item|
      items = items + item.quantity
    end
    if items == 0
      return "empty"
    else
      items
    end
  end
  
end
