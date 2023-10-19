# frozen_string_literal: true

# No need to drag our big sibling, Rails, into the mix.
# Let's keep it simple and use Sinatra.
require 'sinatra'

# Let's use Hiccdown to render our HTML. Templating languages are for chumps.
# Just use Hashes and Arrays and Hiccdown will do the rest.
require 'hiccdown'

# Our index page and entry point for the app.
class Index < Sinatra::Base
  get '/' do
    # Compose our view with data structures vice XHTML
    header = [:h1, "Whadup #{'frank'.upcase}!"]
    body = [:p, 'Put this in your pipe & smoke it!']
    view = [header, body]
    Hiccdown.to_html(view)
  end
end
