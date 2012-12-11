class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #Aallows the request to chose layout
  def get_layout_from_params
    params[:layout] ? params[:layout] : 'application' 
  end
  

  def get_cart_id(business_id)
    #Create cart session hash if user doesnt have one
    if not session[:carts]
      session[:carts] = {}
    end

    #Coerce business_id into string to avoid ambiguity
    #Used as symbol in hash
    business_id = String(business_id)

    #Create cart for (user, business)
    if not session[:carts][business_id]
      new_cart = Cart.new(business_id: business_id)
      
      if user_signed_in?
        new_cart.user_id = current_user.id
      end

      new_cart.save
      session[:carts][business_id] = new_cart.id
    end

    session[:carts][business_id]
  end
end
