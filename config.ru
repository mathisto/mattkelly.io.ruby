require 'roda'
require 'hiccdown'

class App < Roda
  route do |r|
    r.get 'hello', String do |name|
      view = [:h1, "Whadup #{name}!"]
      Hiccdown::to_html(view)
    end
  end
end

run App
