require_relative './routing.rb'

class Fnz
  def initialize(&block)
    @routes = Routing.new(block)
  end

  def request(request)
    route = parse_route(request)
    puts route
    if @routes.get_routes.key? route
      file = @routes.get_routes[route].call
      status_code = 200
    else 
      file = './public/404.html'
      status_code = 404
    end
    
    { 
      :status_code => status_code, 
      :content_type_header => 'text/html', 
      :file_to_serve => file 
    }
  end
  
  def parse_route(request)
    chunks = request.split(' ')
    chunks[1] 
  end

end
