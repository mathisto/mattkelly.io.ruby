# frozen_string_literal: true

# No need to drag our big sibling, Rails, into the mix.
# Let's keep it simple and use Sinatra.
require 'sinatra/base'

# ActiveRecord is a decent ORM an its Sinatra lib is well maintained
require 'sinatra/activerecord'

# I'd like to keep everything as "ruby as possible". Let's use the venerable Markaby.
require 'markaby'

# Our index page and entry point for the app.
class App < Sinatra::Base
  # We have a rake task that generates the literate source views via docco
  set :root, File.dirname(__FILE__)
  set :public_folder, 'docs'
  enable :static

  # Load all our models
  Dir["#{Dir.pwd}/models/*.rb"].each { |file| require file }

  # I'd like to keep the routes in their own file
  require_relative 'routes'
end
