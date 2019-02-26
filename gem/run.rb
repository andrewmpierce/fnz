require_relative './main.rb'

command = ARGV[0]
puts "The command is #{command}"
project = Main.new(command)

case command.downcase
  when 'new'
    project.create_new(ARGV[1])
  when 'migrate'
    project.run_available_migrations
  when 'make_migration'
    project.touch_migration_file
  else
    project.show_help
end


