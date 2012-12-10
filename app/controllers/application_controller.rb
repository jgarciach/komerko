class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_cart_id(business_id)
    cart_id = "cart_" + String(business_id)
    unless session[cart_id]
      new_cart = Cart.new(business_id: business_id)
      if user_signed_in?
        new_cart.user_id = current_user.id
      end
      session[cart_id] = new_cart.save.id
    end
    session[cart_id]
  end

end
