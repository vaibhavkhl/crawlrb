require 'spec_helper'
require 'link_crawler'

RSpec.describe LinkCrawler do
	before(:each) do
    @link_crawler = LinkCrawler.new('http://vaibhavkhl.in', 2)
  end

	it "should have base_url and max_links accessors" do
    @link_crawler.base_url.should eql 'http://vaibhavkhl.in'
    @link_crawler.max_links.should eql 2
  end

  it "should have links_repository, links_visited & links_to_crawl accessors" do
  	@link_crawler.link_repository.should eql []
  	@link_crawler.links_visited.should eql []
  	@link_crawler.links_to_crawl.should eql []
  end

	it "should crawl base url and add links to link repository" do
		@link_crawler.crawl_links
    @link_crawler.link_repository.length.should eql 18
  end

end