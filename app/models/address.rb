class Address < ActiveRecord::Base
  attr_accessible :city, :line1, :line2, :name, :nickname, :phone, :state
  
  belongs_to :user
  has_many :orders
end
