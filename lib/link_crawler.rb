require 'mechanize'

class LinkCrawler
  attr_reader :base_url
  attr_reader :max_links

  def initialize(base_url, max_links)
    @base_url = base_url
    @max_links = max_links
  end

  def crawl_links
	  agent = Mechanize.new
	  page = agent.get(base_url)

	  page.links.each do |link|
		  puts link.uri()
		  #@link_repository.push(link)
		  # if link.uri().class == URI::HTTPS
			 #  begin
		  #     get_links_from_this_link(link)
		  #   rescue
		  # 	  next
		  # end
		end
	end

end