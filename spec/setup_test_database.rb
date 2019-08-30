require 'pg'

def setup_test_database
  connection = PG.connect(dbname: "makers_bnb_test")
  connection.exec("TRUNCATE properties, users RESTART identity;")
  connection.close
end
