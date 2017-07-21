1. CLI for finding roommate
 ~ Sort by price
 ~ Sort by location
 ~ Sort by date
 ~ Show listing
 ~ Update listing

2. Scraping roommates.

3. Persisting to database so it is fast.

# Workflow
  - Get data
  - Instantiate a roommate with the data
  - Save the data
  - Query via SQL

* Started by mkdir 'config', and created an 'environment' file
* Then created a 'Gemfile' by running 'bundle init'
* Now populate Gemfile
* Make another mkdir 'lib'
* Where I will have my classes: room.rb and room_scraper.rb
* Now, I want to make a Rakefile (for a console?)
* Now, setup 'environment'
* Be sure to install 'bundle' ~ 'bundle' in terminal.

## At this point, everything is working, I can start writing code ##
## At this point, I pushed everything up to git, for safe keeping  ##

* New task: scrape_rooms added to Rakefile.  @ 6:15ish
  ## Avi is now stubbing out the functionality of the cli ##
* We've established the type of functionality (see notes below from Rakefile)

  # 1. Instantiate a new scraper and then find new rooms

  # 2. After this method call, I should be able to say Room.all and it returns the rooms

  # 3. So this will work by you passing it the url.  For instance, you could have   a Chicago scraper so, the idea is that the url doesn't change except for the city, there is a pattern forming

* It's time to start writing some code.  We'll start with RoomScraper
   !! 'rake scrape_rooms' worked, just took a while !!

* So now we want to think about the data we want from craigslist
  ~ date
  ~ title
  ~ price
  ~ url
     # These will be come attributes in my Room class (This is done now)

* Begin to stub-out some of the #methods needed for the actual scrapping
* Rewrote the #scrape_time method to be #rows
* Now, going to write the #call method 
