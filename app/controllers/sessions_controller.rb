class SessionsController < Devise::SessionsController
  def create
    super 
    if session[:carts]
      session[:carts] = Cart.assign_carts_to_user(current_user, session[:carts])
    end
  end
end
