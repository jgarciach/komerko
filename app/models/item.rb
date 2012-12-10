class Item < ActiveRecord::Base
  attr_accessible :name, :price, :description, :business_id
  
  belongs_to :business

  has_many :cart_items
  has_many :items, through: :cart_items

  has_many :order_items
  has_many :orders, through: :order_items
end
