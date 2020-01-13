class UserBookmarks
  attr_reader :author

  def initialize(author, bookmarks = [])
    @author = author
    @bookmarks = bookmarks
  end

  def self.create(author, bookmarks = [])
    @user_bookmarks = UserBookmarks.new(author, bookmarks)
  end

  def self.instance
    @user_bookmarks
  end

  def all
    @bookmarks.clone
  end
end