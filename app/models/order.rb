class Order < ActiveRecord::Base
  attr_accessible :order_type, :guest

  belongs_to :user
  accepts_nested_attributes_for :user 
  has_many :order_items
  has_many :items, through: :order_items
end
