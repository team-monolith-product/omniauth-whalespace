# frozen_string_literal: true

require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Whalespace < OmniAuth::Strategies::OAuth2
      option :name, "whalespace"
      option :client_options,
             site: "https://auth.whalespace.io",
             authorize_url: "https://auth.whalespace.io/oauth2/v1/authorize",
             token_url: "oauth2/v1/token"

      uid do
        raw_info["sid"]
      end

      info do
        {
          name: raw_info.dig("name", "fullName"),
          email: raw_info["primaryEmail"]
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get("https://api.whalespace.io/oauth2/v1/userinfo").parsed
      end
    end
  end
end
