class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_cart_id
    unless session[:cart_id]
      session[:cart_id] = Cart.create.id
    end
    session[:cart_id]
  end

end
