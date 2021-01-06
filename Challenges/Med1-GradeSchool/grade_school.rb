class Student
  attr_reader :name, :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end
end

class School
  def initialize
    @students = []
  end

  def add(name, grade)
    @students << Student.new(name, grade)
  end

  def to_h
    @students.sort_by!(&:grade)
    @students.group_by(&:grade).each_value { |students| students.map!(&:name).sort! }
  end

  def grade(value)
    students = to_h[value]
    students ? students : []
  end
end
