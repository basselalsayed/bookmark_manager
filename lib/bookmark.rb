require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.create(title:, url:)
    connection = PG.connect :dbname => environment, :user => 'bsas'
    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}')")
  end

  def self.all
    connection = PG.connect :dbname => environment, :user => 'bsas'
    result = connection.exec("SELECT * FROM bookmarks")
    # result.map { |row| "#{row['id']} #{row['title']}: #{row['url']}" }
    result.map { |row| Bookmark.new(id: row['id'], title: row['title'], url: row['url']) }
  end 

  def self.environment
    ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
  end

end
