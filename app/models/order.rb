class Order < ActiveRecord::Base
  attr_accessible :order_type, :guest, :email, :first_name, :last_name

  belongs_to :user
  
  has_many :order_items
  has_many :items, through: :order_items
end
