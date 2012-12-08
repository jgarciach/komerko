class User < ActiveRecord::Base
  after_create :create_cart 
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :guest

  has_one :cart
  has_many :orders

  def create_cart
    self.cart = Cart.new 
  end

end
