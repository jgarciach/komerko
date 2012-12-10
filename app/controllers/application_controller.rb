class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_cart_id(business_id)
    unless session[:carts][business_id]
      session[:carts][business_id] = Cart.create(business_id: business_id).id
    end
    session[:carts][business_id]
  end

end
