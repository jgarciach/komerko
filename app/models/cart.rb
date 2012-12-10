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
end
