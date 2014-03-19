# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google-oauth2-installed/version'

Gem::Specification.new do |spec|
  spec.name          = "google-oauth2-installed"
  spec.version       = GoogleOauth2Installed::VERSION
  spec.authors       = ["Amiel Martin", "Kristian Freeman"]
  spec.email         = ["amiel@carnesmedia.com", "kristian@carnesmedia.com"]
  spec.summary       = %q{
    Configure and authenticate to google with OAuth2 as an installed application
  }

  spec.description   = %q{
    Extracted from applications that use the DFP and Analytics apis,
    google-oauth2-installed helps with configuration (from ENV).
    It also helps with setup by providing an easy command to generate your OAuth tokens.
  }

  spec.homepage      = "https://github.com/carnesmedia/google-oauth2-installed"
  spec.license       = "MIT"

  spec.files         = Dir['[A-Z]*']
  spec.files        += Dir['lib/**/*.{rb,rake}']
  spec.files        += spec.test_files = Dir['spec/**/*.rb']

  spec.require_paths = ["lib"]

  spec.add_dependency 'oauth2'
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
