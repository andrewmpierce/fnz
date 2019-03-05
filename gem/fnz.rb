require_relative './routing.rb'

class Fnz
  def initialize
    @routes = load_routes
    
  end

  def call
    'hello'
  end

  def load_routes
    
  end

  def request(request)
    puts request  
    request
  end
end
