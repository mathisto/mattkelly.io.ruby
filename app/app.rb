# frozen_string_literal: true

# No need to drag our big sibling, Rails, into the mix.
# Let's keep it simple and use Sinatra.
require 'sinatra/base'

# I'd like to keep everything as "ruby as possible". Let's use the venerable Markaby.
require 'markaby'

# Our index page and entry point for the app.
class App < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :public_folder, 'docs'
  enable :static

  get '/' do
    markaby :index
  end

  get '/api' do
    content_type :json
    { params: }.to_json
  end
end
