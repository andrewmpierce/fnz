require 'socket'
require 'pg'
require 'pry'

server = TCPServer.new 2000 # Server bound to port 2000

def get_users
  conn = PG.connect(dbname: 'foo')
  conn.exec("SELECT * FROM users")
end

def create_user(params)
  conn = PG.connect(dbname: 'foo')
  conn.exec("INSERT INTO users(first_name, last_name) VALUES('#{params["firstname"]}', '#{params["lastname"]}')") 
  conn.close
end

def get_params(request)
  params = {}
  query_string = request.split("?")[1].split(" ")[0] # strips off the beginning request type and the ending HTTP version
  fields = query_string.sub('+', ' ') #spaces in the input fields are converted to + signs when sent in the http request. 
  fields.split("&").each do |field|
    puts field.split("=")[1]
    params[field.split("=")[0]] = field.split("=")[1]
  end
  params
end

form = <<-FORM
<form>
  First Name: <br>
  <input type="text" name="firstname"><br>
  Last name:<br>
  <input type="text" name="lastname"><br>
  <input type="submit" value="Submit">
</form>
FORM

loop do
  client = server.accept    # Wait for a client to connect
  request = client.gets
  puts request
  if request.include? '?'
    create_user(get_params(request)) 
  end
  users = get_users

  client.print "HTTP/1.1 200\r\n"
  client.print "Content-Type: text/html\r\n"
  client.print "\r\n"
  client.puts "<p>The users in the table are:</p>"
  users.each do |user|
    client.puts "<p>#{user["first_name"]} #{user["last_name"]}</p>"
  end
  client.puts "<br><br><br>"
  client.puts form
  client.close
end
