require 'bundler'
Bundler.require


Mongoid.load!("./mongoid.yml")

use Rack::Session::Cookie, :secret => 'change_me'

use OmniAuth::Builder do
  # For additional provider examples please look at 'omni_auth.rb'
  provider :google_oauth2, "908297860097-cvrlevd7kvguuc9r45bunvq647lddfkc.apps.googleusercontent.com", "5J1vHDizqFRcOjM505l2UgCa", {}
end

