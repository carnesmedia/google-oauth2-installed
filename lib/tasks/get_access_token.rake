
namespace :googleoauth2installed do
  desc "Get an access token suitable for ongoing application use"
  task :get_access_token do
    require 'google-oauth2-installed'
    GoogleOauth2Installed.get_access_token
  end
end
