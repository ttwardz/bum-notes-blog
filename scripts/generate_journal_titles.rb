#!/usr/bin/env ruby
# Generates titles for journal posts from their content
# Run before jekyll build: ruby scripts/generate_journal_titles.rb

require 'yaml'
require 'date'

POSTS_DIR = File.join(__dir__, '..', '_posts')
WORD_COUNT = 8

Dir.glob(File.join(POSTS_DIR, '*-journal.md')).each do |path|
  content = File.read(path)

  # Parse frontmatter
  if content =~ /\A---\n(.*?\n)---\n(.*)/m
    raw_frontmatter = $1
    frontmatter = YAML.safe_load(raw_frontmatter, permitted_classes: [Date, Time])
    body = $2

    # Only process journal layout posts
    next unless frontmatter['layout'] == 'journal'

    # Skip if already has a custom title (not auto-generated)
    if frontmatter['title'] && !frontmatter['title'].start_with?('Journal:')
      puts "Skipping #{File.basename(path)} - has custom title"
      next
    end

    # Strip markdown and get plain text
    plain_text = body
      .gsub(/\[([^\]]+)\]\([^)]+\)/, '\1')  # [text](url) -> text
      .gsub(/[*_`#\[\]]/, '')               # Remove markdown formatting
      .gsub(/\n+/, ' ')                     # Newlines to spaces
      .strip

    # Extract first N words
    words = plain_text.split(/\s+/).first(WORD_COUNT)
    next if words.empty?

    excerpt = words.join(' ')
    excerpt += '...' if plain_text.split(/\s+/).length > WORD_COUNT

    new_title = "Journal: #{excerpt}"

    # Add or update title in frontmatter
    if raw_frontmatter.include?('title:')
      # Replace existing title
      new_frontmatter = raw_frontmatter.gsub(/^title:.*$/, "title: \"#{new_title}\"")
    else
      # Add title at end of frontmatter (ensure newline before it)
      new_frontmatter = raw_frontmatter.chomp + "\ntitle: \"#{new_title}\"\n"
    end

    # Write back
    new_content = "---\n#{new_frontmatter}---\n#{body}"
    File.write(path, new_content)

    puts "Updated: #{File.basename(path)}"
    puts "  Title: #{new_title}"
  end
end

puts "Done!"
