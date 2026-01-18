#!/usr/bin/env ruby
require 'yaml'
require 'liquid'

# Load site config
site_config = YAML.load_file('_config.yml')

# Read the Markdown file (including front matter)
content = File.read('syllabus.md')

# Extract front matter and body
fm, body = content.split(/^---\s*$/, 3)[1..2]
page_data = YAML.safe_load(fm)
# page_data    = front_matter ? YAML.safe_load(front_matter) : {}
template  = Liquid::Template.parse(body)
context   = { 'site' => site_config, 'page' => page_data }
rendered  = template.render(context)

# Look up author data if needed (e.g. from _data/authors.yml)
# authors = YAML.load_file('_data/authors.yml')
# site_config['author'] = authors[site_config['author']] if site_config['author'].is_a?(String)

File.open('syllabus_rendered.md', 'w') do |f|
  f.puts '---'
  f.puts fm.strip  # no blank line after the opening '---':contentReference[oaicite:1]{index=1}
  f.puts '---'
  f.puts rendered
end

puts 'Rendered Markdown written to syllabus_rendered.md'
