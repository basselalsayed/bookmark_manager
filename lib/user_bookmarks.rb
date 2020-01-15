require 'pg'

class Bookmarks
  attr_reader :author

  def initialize(bookmarks = [])
    @bookmarks = bookmarks
  end

  def self.create(bookmark)
    # @user_bookmarks = Bookmarks.new(bookmarks)
    connection = PG.connect :dbname => environment, :user => 'bsas'
    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{bookmark.to_s}')")

  end

  def self.instance
    @user_bookmarks
  end

  def self.all
    connection = PG.connect :dbname => environment, :user => 'bsas'
    result = connection.exec("SELECT * FROM bookmarks")
    result.map { |row| "#{row['id']}: #{row['url']}" }
  end 

  def self.environment
    ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
  end
end
