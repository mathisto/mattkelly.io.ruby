# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'activerecord'
gem 'byebug'
# https://github.com/dchacke/hiccdown
gem 'dotenv'
gem 'httpx'
gem 'markaby', '~> 0.9.0'
gem 'pg'
gem 'puma'
gem 'rake'
gem 'rss', '~> 0.3.0'
gem 'sidekiq', '~> 7.1'
gem 'sidekiq-scheduler', '~> 5.0'
# https://sinatrarb.com/intro.html
gem 'sinatra', require: 'sinatra/base'
gem 'sinatra-activerecord'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rubocop'
end

group :development, :test do
  gem 'amazing_print'
  gem 'pry'
  gem 'rerun'
end
