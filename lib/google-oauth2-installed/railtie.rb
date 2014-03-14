class GoogleOauth2Installed::Railtie < ::Rails::Railtie
  rake_tasks do
    load "tasks/get_access_token.rake"
  end
end
