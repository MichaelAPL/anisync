require 'omniauth/strategies/my_anime_list'
require 'omniauth/strategies/anilist'
#require 'omniauth/strategies/kitsu'

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :my_anime_list, ENV['mal_client_id'], ENV['mal_client_secret']
  provider :anilist, ENV['anilist_client_id'], ENV['anilist_client_secret']
  #provider :kitsu, ENV['kitsu_client_id'], ENV['kitsu_client_secret']
end