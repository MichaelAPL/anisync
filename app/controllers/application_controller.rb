class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def user_sign_out
    sign_out_and_redirect(current_user)
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  
  def after_sign_in_path_for(current_user)
    if !current_user.authentication_providers.empty?
      dashboard_path
    else
      authentication_providers_path
    end
  end  
end
