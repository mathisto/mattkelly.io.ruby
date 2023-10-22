# frozen_string_literal: true

require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require 'dotenv/tasks'

namespace :db do
  task :load_config do
    require './app/app'
  end
end

task :generate_literate_views do
  desc 'Build Literate Source Views'
  # First we clear out all the existing rendered HTML.
  # TODO: Only regenerate diffed files
  `rm -rf docs/**/*.html`
  # Render all Markdown annotated ruby files, including Markaby templates, that are present in the `app` directory into HTML
  `docco --layout=default --extension=rb app/**/*`
end
