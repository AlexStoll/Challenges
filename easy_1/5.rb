# Given a number, find the sum of all the multiples
# of numbers up to but not including that number.

# Default to 3 and 5.
# So SumOfMultiples.to(20) => 78
# (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18)


class SumOfMultiples
  attr_reader :vars

  def initialize(*vars)
    @vars = vars
  end

  def self.to(limit, vars=[3, 5])
    (0...limit).select do |num|
      vars.any? { |mult| num % mult == 0 }
    end.inject(:+)
  end

  def to(limit)
    self.class.to(limit, @vars)
  end
end


a = SumOfMultiples.new(3, 4, 5)
p a.vars