require_relative './db.rb'
require_relative './http.rb'
require 'fileutils'

class Main 
  def initialize(command)
    @command = command
  end

  def create_new(project_name)
    Dir.mkdir('sql') unless Dir.exists?('sql')
    db = Db.new(project_name)
    db.create_db
  end

  def process_http_request(request)
  end

  def run_available_migrations
    puts "This will run migrations eventually"
  end

  def touch_migration_file(file_name)
    filename_with_timestamp = unix_timestamp_string +  '-' + file_name + '.sql'
    FileUtils.touch('sql/' + filename_with_timestamp)
  end

  def serve
    puts 'You now have an application running on port 2000.'
    server = Server.new()
    server.serve
  end

  def show_help
    puts "This will be a help thing eventually"
  end

  private def unix_timestamp_string
    Time.now.to_i.to_s
  end
end

