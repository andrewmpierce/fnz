require 'socket'
require 'pg'

server = TCPServer.new 2000 # Server bound to port 2000

def get_users
  conn = PG.connect(dbname: 'foo')
  conn.exec("SELECT * FROM users")
end

loop do
  client = server.accept    # Wait for a client to connect
  request = client.gets
  users = get_users

  client.print "HTTP/1.1 200\r\n"
  client.print "Content-Type: text/html\r\n"
  client.print "\r\n"
  client.puts "<p>The users in the table are:</p>"
  users.each do |user|
    client.puts "<p>#{user["first_name"]} #{user["last_name"]}</p>"
  end
  client.close
end
