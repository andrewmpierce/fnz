require_relative './db.rb'
require_relative './http.rb'

class Main 
  def initialize(command)
    @command = command
  end

  def create_new(project_name)
    puts 'new'
  end

  def process_http_request(request)
  end

  def run_available_migrations
    puts "This will run migrations eventually"
  end

  def touch_migration_file
   puts 'this will create a migration file eventually'
  end

  def serve
    puts 'You now have an application running on port 2000.'
  end

  def show_help
    puts "This will be a help thing eventually"
  end
end

