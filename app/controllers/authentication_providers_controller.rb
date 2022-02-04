class AuthenticationProvidersController < ApplicationController
  def select_providers
    
  end

  def create
    is_primary = current_user.authentication_providers.empty?
    auth_provider = AuthenticationProvider.new(provider_name: auth_hash.provider, uid: auth_hash.uid, 
                                              user_name: auth_hash.extra.raw_info.name, access_token: auth_hash.credentials.token,
                                              refresh_token: auth_hash.credentials.refresh_token, expires_at: auth_hash.credentials.expires_at,
                                              is_primary: is_primary)
    auth_provider.user = current_user

    if auth_provider.save
      redirect_to dashboard_path
    else
      render plain: current_user
    end
  end

  protected
  
  def auth_hash
    request.env["omniauth.auth"]
  end
end
