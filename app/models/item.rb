class Item < ActiveRecord::Base
  attr_accessible :name, :price
  
  has_many :cart_items
  has_many :carts, through: :cart_items
end
