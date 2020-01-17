require_relative 'data_base_connection'

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
    return false unless is_url?(url)
    DataBaseConnection.setup(environment)
    DataBaseConnection.query("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}')")
  end

  def self.delete(id:)
    DataBaseConnection.setup(environment)
    DataBaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, title:, url:)
    DataBaseConnection.setup(environment)
    DataBaseConnection.query("UPDATE bookmarks SET title = '#{title}', url = '#{url}' WHERE id = #{id}")
  end

  def self.all
    DataBaseConnection.setup(environment)
    result = DataBaseConnection.query("SELECT * FROM bookmarks")
    # result.map { |row| Bookmark.new(id: row['id'], title: row['title'], url: row['url']) }
    result.map { |row| Bookmark.new(row) }
  end 

  def self.environment
    ENV['RACK_ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
