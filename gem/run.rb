require_relative './main.rb'
require_relative './http.rb'

command = ARGV[0]
project = Main.new(command)

case command.downcase
  when 'new'
    project.create_new(ARGV[1])
  when 'migrate'
    project.run_available_migrations
  when 'make_migration'
    project.touch_migration_file
  when 'serve' 
    server = Server.new()
    server.serve
  else
    project.show_help
end


