# frozen_string_literal: true

# Bootstrap bundler ASAP so Dotenv can load as early as possible
require 'bundler'
Bundler.require

# We need these ENV vars supplied by Dokku to the app
require 'dotenv'
Dotenv.load

# Speaking of the app, let's load it next.
require './app/app'
run App

# Set up our redis/sidekiq connection and mount point
# We will need an session key
require 'securerandom'
File.open('.session.key', 'w') { |f| f.write(SecureRandom.hex(32)) }
use Rack::Session::Cookie, secret: File.read('.session.key'), same_site: true, max_age: 86_400

# Lets's mount our app and the Sidekiq web UI
run Rack::URLMap.new('/' => App, '/sidekiq' => Sidekiq::Web)
