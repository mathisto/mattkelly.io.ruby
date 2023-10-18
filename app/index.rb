# frozen_string_literal: true

require 'sinatra'
require 'hiccdown'

class Index < Sinatra::Base
  get '/' do
    header = [:h1, "Whadup #{'frank'.upcase}!"]
    body = [:p, 'Put this in your pipe & smoke it!']
    view = [header, body]
    Hiccdown.to_html(view)
  end
end
