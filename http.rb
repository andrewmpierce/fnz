require 'socket'

server = TCPServer.new 2000 # Server bound to port 2000

loop do
  client = server.accept    # Wait for a client to connect
  request = client.gets
  puts request
  puts client

  client.print "HTTP/1.1 200\r\n"
  client.print "Content-Type: text/html\r\n"
  client.print "\r\n"
  client.print "Time is #{Time.now}"
  client.close
end
