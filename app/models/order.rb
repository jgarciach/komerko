class Order < ActiveRecord::Base
  attr_accessible :order_type
  
  has_many :order_items
  has_many :items, through: :order_items
end
