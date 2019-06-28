# Store student's names and their grades

# A hash where the keys are grade numbers
# values are arrays of the names of students in each grade

# { 1 => ["Bob", "Mary", "Joel"], 2 => ["Tina"], 3 => ["Andre", "Pedro"]

# Be able to: add a student's name to the roster.
# Get a list of all students enrolled in a grade.
# Get a sorted list of students in all grades
# => Grades ascending, students alphabetical

class School
  def initialize
    @roster = {}
  end

  def add(name, grade)
    @roster[grade] ? @roster[grade] << name : @roster[grade] = [name]
  end

  def grade(year)
    @roster[year] || []
  end

  def to_h
    @roster.sort.to_h.each { |_, names| names.sort!}
  end
end
