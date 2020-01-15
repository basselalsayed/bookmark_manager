require 'pg'

class Bookmarks
  attr_reader :author

  def initialize(author, bookmarks = [])
    @author = author
    @bookmarks = bookmarks
  end

  def self.create(author, bookmarks = [])
    @user_bookmarks = Bookmarks.new(author, bookmarks)
  end

  def self.instance
    @user_bookmarks
  end

  def all
    p ENV['RACK_ENV']
    con = PG.connect :dbname => environment, :user => 'bsas'
    result = con.exec("SELECT * FROM bookmarks") 
    result.each { |r| p r }
      result.map { |row| "#{row['id']}: #{row['url']} " }
  end 

  def environment
    ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
  end
end
