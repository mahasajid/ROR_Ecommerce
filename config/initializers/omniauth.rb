require 'omniauth-google-oauth2'
require 'dotenv'

Dotenv.load 
OmniAuth.config.allowed_request_methods = %i[post, get]

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV["GOOGLE_OAUTH_CLIENT_ID"], ENV["GOOGLE_OAUTH_CLIENT_SECRET"]
  end

#   Rails.application.config.middleware.use OmniAuth::Builder do
#     provider :google_oauth2, Rails.application.secrets.google_client_id, Rails.application.secrets.google_client_secret
#   end