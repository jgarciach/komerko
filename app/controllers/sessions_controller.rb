class SessionsController < Devise::SessionsController
  layout :get_layout_from_params
      
  def create
    super 
    if session[:carts]
      session[:carts] = Cart.assign_carts_to_user(current_user, session[:carts])
    end
  end
  
end
