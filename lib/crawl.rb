require 'link_crawler.rb'

class Crawl
  def self.crawl_links(base_url, max_links)
    link_crawler = LinkCrawler.new(base_url, max_links)
    link_crawler.crawl_links
    puts "Done crawling"
    link_crawler.export_links
  end
end

