require_relative './routing.rb'

class Fnz
  def initialize(&block)
    @routes = Routing.new(block)
  end

  def request(request)
    puts request
    { 
      :status_code => 200, 
      :content_type_header => 'text/html', 
      :file_to_serve => './public/index.html'
    }
  end

end
