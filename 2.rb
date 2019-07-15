# Takes a written math problem and returns the answer as an integer
# "What is 5 plus 13?"
# => 18
# What is 7 minus 5 minus 1?
# => 1

# Calculate at each step, not in proper order of operations
# 3 + 2 * 3 = 15, to 9

# Use the send method to make it work nicely

# Steps
# remove everything that isn't a digit or operation
# keep 0-9, plus, minus, divided, and multiplied

class WordProblem
  OPERATORS = { 'plus' => '+', 'minus' => '-',
                'divided' => '/', 'multiplied' => '*'}

  attr_reader :operands, :numbers

  def initialize(problem)
    @numbers = problem.scan(/-?\d+/).map(&:to_i)
    @operators = problem.scan(/plus|minus|divided|multiplied/)
  end

  def answer
    p @operators
    @operators.each_with_index.reduce(@numbers.first) do |result, (operator, idx)|
      result.send(OPERATORS[operator], @numbers[idx + 1])
    end
  end
end

p WordProblem.new('What is 53 plus -2?').answer

