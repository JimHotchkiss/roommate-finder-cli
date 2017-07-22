require 'bundler'
Bundler.require #This will load all of my gems
require 'open-uri'

DB {
  :connection => SQLite3::DataBase.new("db/rooms-development.sqlite")
  
}

require_all 'lib'
