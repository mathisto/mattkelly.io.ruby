# frozen_string_literal: true

# No need to drag our big sibling, Rails, into the mix.
# Let's keep it simple and use Sinatra.
require 'sinatra/base'

# ActiveRecord is a fantastic ORM
require 'sinatra/activerecord'

# I'd like to keep everything as "ruby as possible". Let's use the venerable Markaby.
require 'markaby'

# Our index page and entry point for the app.
class App < Sinatra::Base
  set :database, { adapter: 'pg', database: 'mattkelly_io_db' }
  set :root, File.dirname(__FILE__)
  set :public_folder, 'docs'
  enable :static

  # The ["Landing Page"](/)
  get '/' do
    markaby :index
  end

  # The ["Landing Page"](/api) which simply echos params
  get '/api' do
    content_type :json
    { params: }.to_json
  end
end
