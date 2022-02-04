require 'omniauth-oauth2'
require 'securerandom'

module OmniAuth
  module Strategies
    class MyAnimeList < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "my_anime_list"
      #option :provider_ignores_state, true
      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        site: 'https://api.myanimelist.net/v2',
        authorize_url: 'https://myanimelist.net/v1/oauth2/authorize',
        token_url: 'https://myanimelist.net/v1/oauth2/token',
        auth_scheme: :request_body   
      }                       
      
      # You may specify that your strategy should use PKCE by setting
      # the pkce option to true: https://tools.ietf.org/html/rfc7636
      option :pkce, true
      option :pkce_options, {
        code_challenge: proc { |verifier| verifier },
        code_challenge_method: "plain",
      }

      uid{ raw_info['id'] }

      info do
        {
          id: raw_info['id'],
          name: raw_info['name']
        }
      end

      extra do
        hash = {}
        hash['raw_info'] = raw_info
        hash
      end

      # We don't need the query_string
      def callback_url
        full_host + callback_path
      end

      protected

      def raw_info
        @raw_info ||= access_token.get('users/@me').parsed
      end
    end
  end
end