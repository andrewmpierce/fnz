require 'socket'
require 'pg'

class Server
  def initialize(port=2000) 
    @server = TCPServer.new port # Server bound to port 2000 by default
  end

  def content(html_file)
    # Right now we are slurping the file (dumping the whole thing into 
    # memory at once) It's not the most performant, but its works easy 
    # enough for now
    File.read html_file
  end

  def status_header(status_code=200)
    "HTTP/1.1 #{status_code}\r\n"
  end

  def content_type_header(type="text/html")
    "Content-Type: #{type}\r\n"
  end

  def new_line
    "\r\n"
  end

  def process(request)
    # This is where the magic really happens! This is where we query the fnz
    # application and get back a request hash. If we were using Rack, this is
    # where we'd put it.  
    { 
      :status_code => 200, 
      :content_type_header => 'text/html', 
      :file_to_serve => './public/index.html'
    }
  end

  def serve
    loop do
      client = @server.accept    # Wait for a client to connect
      request = client.gets

      response_hash = process(request)

      client.print status_header(response_hash[:status_code])
      client.print content_type_header(response_hash[:content_type])
      client.print new_line 
      client.print content(response_hash[:file_to_serve])
      client.close
    end
  end
end


server = Server.new
server.serve
