def setup_test_database
  DataBaseConnection.setup('bookmark_manager_test')
  DataBaseConnection.query('TRUNCATE TABLE bookmarks')
  DataBaseConnection.query("INSERT INTO bookmarks (title, url) VALUES ('Google', 'http://www.google.com')")
end
