# frozen_string_literal: true

require 'securerandom';
require './app/app'

run App

# Set up our redis/sidekiq connection and mount point
# We will need an session key
File.open('.session.key', 'w') { |f| f.write(SecureRandom.hex(32)) }

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" }
end

use Rack::Session::Cookie, secret: File.read('.session.key'), same_site: true, max_age: 86_400
run Rack::URLMap.new('/' => App, '/sidekiq' => Sidekiq::Web)
