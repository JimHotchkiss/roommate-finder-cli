class RoomScraper

  def initialize(index_url)
    # 1. Going to open url, so it's ready from scapping (don't forget open-uri in environment)
    @doc = Nokogiri::HTML(open(index_url))
    # 2. At this point, lets see where we're at, throw in a 'pry'
    binding.pry
  end

# 3. Start to stub-out the different methods needed to scrape the needed attributes 
  def scrape_time
    @doc.search('time.result-date')
  end

end
