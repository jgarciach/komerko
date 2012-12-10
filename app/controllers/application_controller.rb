class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_cart_id(business_id)
    cart_id = "cart_" + String(business_id)
    unless session[cart_id]
      session[cart_id] = Cart.create(business_id: business_id).id
    end
    session[cart_id]
  end

end
