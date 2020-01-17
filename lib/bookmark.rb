require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(database_row)
    # @id = id
    # @title = title
    # @url = url
    @id = database_row['id']
    @title = database_row['title']
    @url = database_row['url']
  end

  def self.create(title:, url:)
    connection = PG.connect :dbname => environment, :user => 'bsas'
    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}')")
  end

  def self.delete(id:)
    connection = PG.connect :dbname => environment, :user => 'bsas'
    connection.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.all
    connection = PG.connect :dbname => environment, :user => 'bsas'
    result = connection.exec("SELECT * FROM bookmarks")
    # result.map { |row| Bookmark.new(id: row['id'], title: row['title'], url: row['url']) }
    result.map { |row| Bookmark.new(row) }
  end 

  def self.environment
    ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
  end

end
