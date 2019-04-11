require_relative('../db/sql_runner.rb')

class House

  attr_reader :id
  attr_accessor :name, :logo

def initialize(details)
  @id = details['id'].to_i
  @name = details['name']
  @logo = details['logo']
end

def save()
    sql = "INSERT INTO houses (name, logo)
          VALUES ($1, $2)
          RETURNING id"
    values = [@name, @logo]
    student = SqlRunner.run(sql, values)
    @id = student[0]['id'].to_i
end

def self.all()
  sql = "SELECT * FROM houses"
  houses = SqlRunner.run(sql)
  return houses.map{|house| House.new(house)}
end

def self.find_by_id(id)
  sql = "SELECT * FROM houses WHERE id = $1"
  values = [id]
  house = SqlRunner.run(sql, values)[0]
  return House.new(house)
end

end
