class Business < ActiveRecord::Base
  attr_accessible :email, :name, :phone

  has_many :items
  has_many :orders
  has_many :carts  

end
