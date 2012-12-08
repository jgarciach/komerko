class Order < ActiveRecord::Base
  attr_accessible :order_type

  belongs_to :user
  accpets_nested_attributes_for :user 
  has_many :order_items
  has_many :items, through: :order_items
end
