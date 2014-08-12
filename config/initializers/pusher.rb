# config/initializers/pusher.rb
require 'pusher'

Pusher.url = Rails.application.secrets.pusher_url
Pusher.logger = Rails.logger