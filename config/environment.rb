require 'bundler/setup'
require 'base64'

Bundler.require

require_relative '../lib/sql_queries'
require 'sqlite3'

# Connect to the database
DB = SQLite3::Database.new("bears.db")

# Create the bears table if it doesn't exist
DB.execute <<-SQL
  CREATE TABLE IF NOT EXISTS bears (
    id INTEGER PRIMARY KEY,
    name TEXT,
    sex TEXT,
    age INTEGER,
    alive BOOLEAN
  );
SQL

# Load the SQL statements from insert.sql
insert_sql = File.read(File.join(__dir__, 'lib', 'insert.sql'))
DB.execute_batch(insert_sql)
