require 'oauth2'

module GoogleOauth2Installed
  class AccessToken < Struct.new(:credentials)

    def access_token
      token = OAuth2::AccessToken.from_hash(client, token_hash)
      token.expired? ? token.refresh! : token
    end

    private

    def client
      @_client ||= OAuth2::Client.new(*oauth2_info)
    end

    def oauth2_info
      credentials.values_at(:oauth2_client_id, :oauth2_client_secret, :oauth2_urls)
    end

    def token_hash
      credentials[:oauth2_token]
    end

  end
end
