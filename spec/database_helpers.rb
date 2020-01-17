require 'pg'

def setup_test_database
  connection = PG.connect :dbname => 'bookmark_manager_test'
  connection.exec('TRUNCATE TABLE bookmarks')
  connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Google', 'http://www.google.com')")
end
