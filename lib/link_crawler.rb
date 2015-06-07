require 'mechanize'
#require 'fileutils'

class LinkCrawler
  attr_reader :base_url
  attr_reader :max_links
  attr_accessor :link_repository
  attr_accessor :links_to_crawl
  attr_accessor :links_visited

  def initialize(base_url, max_links)
    @base_url = base_url
    @max_links = max_links
    @link_repository = []
    @links_to_crawl = []
    @links_visited = []
    @agent = Mechanize.new
  end

  def crawl_links
    links_to_crawl.push(base_url)
    puts "starting..."
    start_crawling
  end


  def start_crawling
    while links_to_crawl.count > 0
      if max_crawl?

        next_link = get_next_link
        puts next_link

        begin
          page = @agent.get(next_link)
          links_visited.push(next_link)

          page.links.each do |link|
            link_repository.push(link.uri())
            links_to_crawl.push(link.uri())
          end

        rescue
          next
        end

      end
    end
  end

  def get_next_link
    links_to_crawl.shift
  end

  def max_crawl?
    return true unless max_links
    return true if links_visited.count < max_links
    puts "max limit of #{max_links} reached, stopping..."
    links_to_crawl.clear
    false
  end

  def export_dir
    File.expand_path "#{File.dirname(__FILE__)}/../data/"
  end

  def export_filename
    "#{export_dir}/#{base_url}.txt"
  end

  def write_links_to_file
    #FileUtils.mkdir_p export_dir
    File.open('links.txt', "w+") do |f|
      f.puts(link_repository)
    end
  end

  def export_links
    puts "exporting links repository to links.txt file."
    write_links_to_file
  end

end