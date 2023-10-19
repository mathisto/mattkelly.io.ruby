# frozen_string_literal: true

# No need to drag our big sibling, Rails, into the mix.
# Let's keep it simple and use Sinatra.
require 'sinatra/base'

# I'd like to keep everything as "ruby as possible". Let's use the venerable Markaby.
require 'markaby'

# And finally, we will need our common page layout.
require './app/app'

# Our index page and entry point for the app.
class App < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :public_folder, 'static'
  enable :static

  get '/' do
    markaby do
      div.container do
        h1(class: 'text-4xl font-bold colors-blue-500') { 'mattkelly.io' }
        p 'Brought to you by Ruby, Sinatra, Markaby, and Tailwind CSS.'
      end
    end
  end

  get '/api' do
    content_type :json
    # Just echoes params
    { params: }.to_json
  end
end
