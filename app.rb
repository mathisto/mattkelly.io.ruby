require 'sinatra'
require 'hiccdown'

get '/frank-says' do
  header = [:h1, "Whadup #{frank.upcase}!"]
  body = [:p, "Put this in your pipe & smoke it!"]
  view = [header, body]
  Hiccdown::to_html(view)
end
