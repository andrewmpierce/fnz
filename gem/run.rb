require_relative './main.rb'
require_relative './http.rb'

command = ARGV[0]
project = Main.new(command)
arg = ARGV[1]

case command.downcase
  when 'new'
    project.create_new(arg)
  when 'migrate'
    project.run_available_migrations
  when 'make_migration'
    project.touch_migration_file(arg)
  when 'serve' 
    project.serve
  else
    project.show_help
end


