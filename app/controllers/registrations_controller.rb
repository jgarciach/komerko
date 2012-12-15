class RegistrationsController < Devise::RegistrationsController
  layout :get_layout_from_params

  def after_sign_up_path_for(resource)
    "business/1/store"
  end
end
