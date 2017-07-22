class Room

  attr_accessor :date_created, :title, :price, :url

  def self.create_from_hash(hash)
    new_from_hash(hash).save
  end

  def self.new_from_hash(hash)
    room = self.new
    room.title =        hash[:title]
    room.date_created = hash[:date_created]
    room.price =        hash[:price]
    room.url =          hash[:url]
binding.pry  
    room
  end 

  def save 
    puts "You're about to save #{self}"
  end 

  def self.create_table
    sql = <<-SQL 
      CREATE TABLE IF NOT EXISTS rooms (
        id INTEGER PRIMARY Key AUTOINCREMENT,
        title TEXT,
        date_created TEXT,
        price TEXT,
        url TEXT
      )
    SQL

    DB[:connection].execute(sql)

    
  end 

end 
