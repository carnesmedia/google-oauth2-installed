module GoogleOauth2Installed
  # To be used interactively.
  # See `GoogleOauth2Installed.get_access_token`
  class Setup < Struct.new(:credentials)

    def get_access_token
      checks.check_for_environment!

      auth_url = get_auth_url
      auth_code = ask_for_code auth_url

      token = get_token auth_code

      print_token token
    end

    private

    def checks
      Checks.new credentials
    end

    def client
      oauth2_info = credentials.values_at :oauth2_client_id, :oauth2_client_secret, :oauth2_urls
      @_client ||= OAuth2::Client.new(*oauth2_info)
    end

    def get_auth_url
      client.auth_code.authorize_url({
        scope: scope, redirect_uri: redirect_uri,
        access_type: 'offline', approval_prompt: 'force',
      })
    end

    def ask_for_code(auth_url)
      puts "Please navigate to URL:\n\n\t%s\n\n" % auth_url
      print 'Then log in and paste the verification code: '

      gets.chomp
    end

    def get_token(auth_code)
      client.auth_code.get_token auth_code, redirect_uri: redirect_uri
    end

    def print_token(token)
      env_vars = env_vars_for_token(token).map { |a| a.join('=') }.join("\n")
      puts "\nRetrieved token from google. Put this in .env\n\n%s" % env_vars
    end

    def env_vars_for_token(token)
      names = ["OAUTH2_ACCESS_TOKEN", "OAUTH2_REFRESH_TOKEN", "OAUTH2_EXPIRES_AT"]
      values = [token.token, token.refresh_token, token.expires_at].map { |v| "\"#{v}\"" }

      names.zip(values)
    end

    def redirect_uri
      credentials[:oauth2_redirect_uri]
    end

    def scope
      credentials[:oauth2_scope]
    end

    extend Forwardable
    def_delegator '$stdin', :gets
    def_delegator '$stdout', :puts
  end
end

