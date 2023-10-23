web: thin -R config.ru -a 127.0.0.1 -p 5000 -P tmp/pids/thin.pid -l logs/thin.log start
sidekiq: bundle exec sidekiq --require ./app/workers/montco_siren.rb
