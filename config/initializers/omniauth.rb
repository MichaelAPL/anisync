require 'omniauth/strategies/my_anime_list'

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :my_anime_list, ENV['mal_client_id'], ENV['mal_client_secret']
end