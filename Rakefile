# frozen_string_literal: true

desc 'Build Rocco Docs'
begin
  require 'rocco/tasks'
  # Render all Markdown annotated ruby files, including Markaby templates, into HTML
  `rm -rf static/`
  Rocco.make 'static/', ['app/views/*.mab', 'app/*.rb']
rescue LoadError
  warn "#{$!} — rocco tasks not loaded."
  task :rocco
end
