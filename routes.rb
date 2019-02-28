# here we need to have a routing helper module and define the different http
# request types. Then we pass the route we're defining and the block of things
# we want to do when that happens. Then somehow when the request is processed
# by fnz, it will look at the defined routes, find the one that fits and execute

get './' do 
  './public/index.html'
end

