require 'bundler'
Bundler.require

require "sinatra/reloader" if development?
Mongoid.load!("./mongoid.yml")

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

use Rack::Session::Cookie, :secret => 'change_me'

set :protection, :except => [:json_csrf]

use OmniAuth::Builder do
  # For additional provider examples please look at 'omni_auth.rb'
  provider :google_oauth2, "908297860097-cvrlevd7kvguuc9r45bunvq647lddfkc.apps.googleusercontent.com", "5J1vHDizqFRcOjM505l2UgCa"
end

