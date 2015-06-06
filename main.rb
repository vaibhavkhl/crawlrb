require 'open-uri'
require 'open_uri_redirections'

open('http://python.org', :allow_redirections => :safe) {|f|
  f.each_line {|line| p line}
}