class Item < ActiveRecord::Base
  attr_accessible :name, :price, :description, :business_id
  
  belongs_to :business

  has_many :cart_items
  has_many :items, through: :cart_items

  has_many :order_items
  has_many :orders, through: :order_items

  #Paperclip attr
  attr_accessible :picture
  has_attached_file :picture, styles: {thumb: "100x100>", medium: "218x218>"}, 
                              default_url: "http://placehold.it/400x400"

end
