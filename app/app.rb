# frozen_string_literal: true

# No need to drag our big sibling, Rails, into the mix.
# Let's keep it simple and use Sinatra.
require 'sinatra'

# I'd like to keep everything as "ruby as possible". Let's use the venerable Markaby.
require 'markaby'

# Let's use Hiccdown to render our HTML. Templating languages are for chumps.
# Just use Hashes and Arrays and Hiccdown will do the rest.
require 'hiccdown'

# And finally, we will need our common page layout.
require './app/app'

# Our index page and entry point for the app.
class App < Sinatra::Base
  get '/' do
    markaby do
      div.container do
        h1(class: 'text-4xl font-bold colors-blue-500') { 'mattkelly.io' }
        p 'Brought to you by Ruby, Sinatra, Hiccdown, and Tailwind CSS.'
      end
    end
  end
end
