require_relative './db.rb'
require_relative './http.rb'
require 'fileutils'

class Main 
  def initialize(command)
    @command = command
  end

  def create_new(project_name)
    Dir.mkdir('sql') unless Dir.exists?('sql')
    File.write('sql/migration.log', "DATABASE NAME: #{project_name}\n")
    db = Db.new(project_name)
    db.create_db
  end

  def process_http_request(request)
  end

  def run_available_migrations
    puts "This will run migrations eventually"
    FileUtils.touch('sql/migration.log') unless File.exists?('sql/migration.log')
    all_files = Dir.entries('sql').map { |file| file if !file_exceptions(file) }.compact
    timestamps_already_executed = File.readlines('sql/migration.log').map { |line| line.split('-')[0] }
    files_to_execute = all_files.map { |file| file if !timestamps_already_executed.include? file.split('-')[0] }.compact
    sorted_files = files_to_execute.sort_by { |file| file.split('-')[0] }
    db = Db.new(get_db_name)
    sorted_files.each do |file|
      db.exec_sql(File.read("sql/#{file}"))
      #execute sql
    end
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

  private def get_db_name
    lines = File.open('sql/migration.log').to_a
    database_name_line = lines.first
    # the database name line looks like "DATABASE NAME: $FOO"
    database_name_line.split(' ')[2].chomp
  end

  private def unix_timestamp_string
    Time.now.to_i.to_s
  end

  private def file_exceptions(file)
    file[0] == '.' || file == 'migration.log' 
  end
end

