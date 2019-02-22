require 'pg'

#This should only happen once! When we run fnz new and supply a project name we will run this and create the database with the project name
#
#conn = PG.connect(dbname: 'postgres')
#conn.exec("CREATE DATABASE foo")

conn = PG.connect(dbname: 'foo')

create_query = <<-SQL
CREATE TABLE users (
userID int,
first_name varchar(255),
last_name varchar(255)
);
SQL

insert_query = <<-SQL
INSERT INTO users ( 
first_name, last_name) 
VALUES ( 
'Andrew', 'Pierce');
SQL

#conn.exec(create_query)
#conn.exec(insert_query)
result = conn.exec("DELETE FROM users")
# result.each do |row| 
#   puts row
# end
