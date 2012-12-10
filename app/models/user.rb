class User < ActiveRecord::Base
  after_create :associate_orders_with_user

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :guest

  has_many :cart
  has_many :orders
  has_many :addresses

  def associate_orders_with_user
    #Sets user_id on orders with email == user.email
    Order.where("email = ?", email).each do |order|
        order.assign_user(id) 
    end
  end
end
