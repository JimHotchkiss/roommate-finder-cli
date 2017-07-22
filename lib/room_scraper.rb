class RoomScraper

  def initialize(index_url)
    # 1. Going to open url, so it's ready from scapping (don't forget open-uri in environment)
    @index_url = index_url
    @doc = Nokogiri::HTML(open(index_url))
    # 2. At this point, lets see where we're at, throw in a 'pry'
  end

  def call
    rows.each do |row_doc|
      Room.create_from_hash(scrape_row(row_doc)) # This returns a hash of the attributes
       # => This should put the 'room' in my database
       #now, I want to scrape(row_doc).  So I'll build this method.
    end
  end

# 3. Start to stub-out the different methods needed to scrape the needed attributes
private # Makes it so you can't call these methods outside the object
  def rows
    @doc.search('time.result-date')
    @rows ||= @doc.search('li.result-row') #btw, @doc.search is better than @doc.css.
                                            #the former is more clear about what it's doing.
  end

  def scrape_row(row)
#    Scrape an indivual row.  Want to end up with a hash of attributes
   {
      :date_created => row.search('time.result-date').text, #row.search('time.result-date') => "Jul 21"
      :title => row.search('a.hdrlnk').text, # .result-title
      :price => row.search('span.result-price').text,
      :url => row.search("a.hdrlnk").attribute("href").text #=> this works result-title.
   }

  end

end
