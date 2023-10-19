# frozen_string_literal: true

task :generate_literate_views do
  desc 'Build Literate Source Views'
  # Render all Markdown annotated ruby files, including Markaby templates, into HTML
  `rm -rf docs/**/*.html`
  `docco --layout linear --css "docs/main.css" app/app.rb`
end
