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

    room # This break allows readers to understand you are returning this value
  end

#  def self.new_from_db(row)
#    self.new.tap do |room| # .tap will return the instantiated obj: self.new
#      room.id =           room[0]
#      room.title =        room[1]
#      room.date_created = room[2]
#      room.price =        room[3]
#      room.url =          room[4]
#    end
#  end

  def save
    insert # Goal: update || insert
  end

  def self.all
    sql = <<-SQL
    SELECT * FROM rooms;
    SQL

    DB[:connection].execute(sql)
#    rows = DB[:connection].execute(sql) # This works! Returns a table of nested arrays
#    # So, we want to go from a row to an instance of #<Room>
#      rows.collect do |row|
#        self.new_from_db(row)
#binding.pry
#      end
  end

  def insert
    sql = <<-SQL
      INSERT INTO rooms (title, date_created, price, url) VALUES (?, ?, ?, ?)
    SQL

    DB[:connection].execute(sql, self.title, self.date_created, self.price, self.url)

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
