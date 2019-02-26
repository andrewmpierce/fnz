require 'pg'

class Db
  def initialize(db_name)
    @db_name = db_name
  end

  #This should only be run one time when we first create a fnz project
  def create_db
    conn = PG.connect(dbname: 'postgres')
    @conn.exec("CREATE DATABASE #{@db_name}")
  end

  def connect
    PG.connect(dbname: @db_name)
  end

  def exec_sql(sql)
    conn = connect
    conn.exec(sql)
    conn.close if conn
  end
end
