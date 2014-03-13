# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google/oauth2/installed/version'

Gem::Specification.new do |spec|
  spec.name          = "google-oauth2-installed"
  spec.version       = Google::Oauth2::Installed::VERSION
  spec.authors       = ["Amiel Martin"]
  spec.email         = ["amiel@carnesmedia.com"]
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

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
