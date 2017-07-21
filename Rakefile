require_relative './config/environment'

def reload!
  load_all './lib'
end

task :console do
  Pry.start
end

task :scrape_rooms do
  nyc_scraper = RoomScraper.new('https://newyork.craigslist.org/search/roo')
  #nyc_scraper.call
  #chicago_scraper =  RoomScraper.new('https://chicago.craigslist.org/search/roo').update_rooms
end
