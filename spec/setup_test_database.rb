require 'pg'

p "Setting up test database..."

def setup_test_database
  # connecting to database bookmark_manager_test.
  connection = PG.connect(dbname: 'bookmark_manager_test')

  # executing the command TRUNCATE to clear bookmarks table before testing.
  connection.exec("TRUNCATE bookmarks;")
end