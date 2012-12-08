class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :items, through: :cart_items
  belongs_to :user
end
