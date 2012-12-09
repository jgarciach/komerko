class Address < ActiveRecord::Base
  attr_accessible :city, :line1, :line2, :name, :nickname, :phone, :state, :user_id
  
  belongs_to :user
  has_many :orders
end
