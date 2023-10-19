# frozen_string_literal: true

desc 'Build Rocco Docs'
begin
  require 'rocco/tasks'
  # Render all Markdown annotated ruby files, including Markaby templates, into HTML
  Rocco.make 'public/', ['app/**/*.rb', 'app/**/*.mab']
rescue LoadError
  warn "#{$!} — rocco tasks not loaded."
  task :rocco
end
