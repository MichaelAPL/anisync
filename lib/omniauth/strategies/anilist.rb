require 'json'
require 'omniauth-oauth2'
require  'graphql_wrappers/anilist_api_wrapper'

module OmniAuth
  module Strategies
    class Anilist < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "anilist"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        site: 'https://graphql.anilist.co',
        authorize_url: 'https://anilist.co/api/v2/oauth/authorize',
        token_url: 'https://anilist.co/api/v2/oauth/token',
      }      

      QUERY = AnilistApiWrapper::Client.parse <<-'GRAPHQL'
        {
          User(name: "MichaelAPL"){
            id
            name
            updatedAt
            createdAt            
          }
        }          
      GRAPHQL

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.

      def callback_url
        full_host + callback_path
      end
      
      #uid{ request.params['user_id'] }

      info do
        {
          :name => "anilist",
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info        
        #result = AnilistApiWrapper::Client.query(QUERY)
        @raw_info ||= {}
        #@raw_info ||= result.to_h["data"]["User"].transform_keys(&:to_sym)
      end
    end
  end
end

