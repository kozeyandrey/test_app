require 'pg'

%w[ex_app ex_app_test].each do |db|
  con = PG::Connection.new(dbname: db, port: 5432)

  sql = File.open('db/schema.sql', 'rb', &:read)
  con.exec(sql)

  con.close
end
