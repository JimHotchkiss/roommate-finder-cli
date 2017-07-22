class RoomScraper

  def initialize(index_url)
    # 1. Going to open url, so it's ready from scapping (don't forget open-uri in environment)
    @doc = Nokogiri::HTML(open(index_url))
    # 2. At this point, lets see where we're at, throw in a 'pry'
    binding.pry
  end

# 3. Start to stub-out the different methods needed to scrape the needed attributes
  def rows
    #@doc.search('time.result-date')
    @rows ||= @docs.search('li.result-row') #btw, @doc.search is better than @doc.css.
                                            #the former is more clear about what it's doing.
  end

  private # Makes it so you can't call these methods outside the object
  def call
    rows.each do |row_doc|
      #now, I want to scrape(row_doc).  So I'll build this method.
    end
  end

  def scrape_row(row)
    Scrape an indivual row.  Want to end up with a hash of attributes
    {
      :date_created => row.search('time.result-date').text, #row.search('time.result-date') => "Jul 21"
      :title => row.search('a.result-title.hdrlnk').text,
      :price => row.search('span.result-price').text,
      :url => row.search('a.result-title.hdrlnk').attribute('href').text #=> this works
    }

  end

end
