# We could do something here like read the routes.rb file and create a 
# routes hash? Not sure if thats the most efficient way to do it, but then 
# we could just look up the route and execute the block as the hash value
# Can a hash value be a block? Probably?


class Routing
  attr_reader :get_routes
  attr_reader :post_routes

  def initialize(block)
    @get_routes = {}
    @post_routes = {}
    instance_eval(&block)
  end

  def get(url, &block)
    @get_routes[url] = block
  end

  def post(url, &block)
    @post_routes[url] = block
  end
end
