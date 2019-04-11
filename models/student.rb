require_relative('../db/sql_runner.rb')

class Student

  attr_reader :id
  attr_accessor :first_name, :second_name, :house_id, :age

def initialize(options)
  @id = options['id'].to_i
  @first_name = options['first_name']
  @second_name = options['second_name']
  @house_id = options['house_id'].to_i
  @age = options['age'].to_i
end

def save()
    sql = "INSERT INTO students (first_name, second_name, house_id, age)
          VALUES ($1, $2, $3, $4)
          RETURNING id"
    values = [@first_name, @second_name, @house_id, @age]
    student = SqlRunner.run(sql, values)
    @id = student[0]['id'].to_i
end

def self.all()
  sql = "SELECT * FROM students"
  students = SqlRunner.run(sql)
  return students.map{|student| Student.new(student)}
end

def self.find_by_id(id)
  sql = "SELECT * FROM students WHERE id = $1"
  values = [id]
  student = SqlRunner.run(sql, values)[0]
  return Student.new(student)
end

def full_name
  return "#{@first_name} #{@second_name}"
end

def find_house()
  sql = "SELECT * FROM houses WHERE id = $1"
  values = [self.house_id]
  house = SqlRunner.run(sql, values)[0]
  return House.new(house)
end
end
