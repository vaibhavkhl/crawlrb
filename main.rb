require 'mechanize'

agent = Mechanize.new

page = agent.get('http://python.org')

page.links.each do |link|
  puts link.uri()
end