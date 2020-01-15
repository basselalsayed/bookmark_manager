require 'pg'

def setup_test_database
  connection = PG.connect :dbname => 'bookmark_manager_test', :user => 'bsas'
  connection.exec('TRUNCATE TABLE bookmarks')
  connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com')")
end
