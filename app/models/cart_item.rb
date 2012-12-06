class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item
  attr_accessible :quantity, :item_id, :cart_id
end
