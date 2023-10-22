# frozen_string_literal: true

# As early as possible in your application bootstrap process, load .env:
require 'dotenv'
Dotenv.load

require 'bundler'
Bundler.require

# No need to drag our big sibling, Rails, into the mix.
# Let's keep it simple and use Sinatra.
require 'sinatra/base'

# ActiveRecord is a fantastic ORM
require 'sinatra/activerecord'

# I'd like to keep everything as "ruby as possible". Let's use the venerable Markaby.
require 'markaby'

# I'd like to keep the routes in their own file
require_relative 'routes'

# Our index page and entry point for the app.
class App < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :public_folder, 'docs'
  enable :static

  Dir["#{Dir.pwd}/app/models/*.rb"].each { |file| require file }
end
