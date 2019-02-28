# We could do something here like read the routes.rb file and create a 
# routes hash? Not sure if thats the most efficient way to do it, but then 
# we could just look up the route and execute the block as the hash value
# Can a hash value be a block? Probably?


class Routing
  def initialize
    @get_routes = {}
    @post_routes = {}
  end

  def process_routes
    file = '../routes.rb'

  end

  def get(url, &block)
    @get_routes[url] = &block
  end

  def post(url, &block)
    @post_routes[url] = &block
  end
end
