# frozen_string_literal: true

desc 'Build Rocco Docs'
begin
  require 'rocco/tasks'
  Rocco.make 'public/', 'app/**/*.rb'
rescue LoadError
  warn "#{$!} — rocco tasks not loaded."
  task :rocco
end
