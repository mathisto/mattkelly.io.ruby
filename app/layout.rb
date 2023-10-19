# frozen_string_literal: true

class Layout < Sinatra::Base
  title = 'mattkelly.io'
  body = [:p, 'Put this in your pipe & smoke it!']
  layout = [:html, [:head, [:title, title]], [:body, body]]
  Hiccdown.to_html(layout)
end
