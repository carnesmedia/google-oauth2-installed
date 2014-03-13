# Google Oauth2 Installed

Configure and authenticate to google with OAuth2 as an installed application.

This is for when your application needs to authenticate to google services, as
opposed to your applications users.

Extracted from applications that use the DFP and Analytics apis,
google-oauth2-installed helps with configuration (from ENV).
It also helps with setup by providing an easy command to generate your OAuth tokens.


## Why

Google provides three ways to authenticate with OAuth2:

1. **Web application**. This is what you use when your application needs access
   as the user of your application.
2. **Service account**. This is really what you want, but can only be used by
   applications authenticating with a google apps account. If you have a google
   apps account, do not use GoogleOAuth2Installed, use service accounts instead.
3. **Installed application**. This allows you to authenticate as an application,
   but still requires an `access_token`, which requires user interaction through
   a browser. `google-oauth2-installed` tries to make this process as simple as
   possible. The bad news is that `access_token`s expire. The good news is that
   the `access_token` comes with a `refresh_token` that does not expire. So,
   once you've aquired your tokens, you can store them for later use and forget
   about it.


## Installation

Add this line to your application's Gemfile:

    gem 'google-oauth2-installed'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google-oauth2-installed

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( http://github.com/<my-github-username>/google-oauth2-installed/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
