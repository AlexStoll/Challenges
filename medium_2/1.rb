# An individual palindromic number and its factors
class PalindromeNumber
  attr_accessor :value, :factors

  def initialize(array)
    @value = array[0]
    @factors = array[1].sort.uniq
  end
end

# Creates a list of palindromic numbers for a given range.
class Palindromes
  attr_accessor :palindromes

  def initialize(parameters)
    @min = parameters[:min_factor] || 1
    @max = parameters[:max_factor]
    @palindromes = Hash.new { |hash, key| hash[key] = [] }
  end

  def palindrome?(num)
    num.to_s == num.to_s.reverse
  end

  def generate
    (@min..@max).to_a.repeated_combination(2) do |num1, num2|
      palindromes[num1 * num2] += [[num1, num2]] if palindrome?(num1 * num2)
    end
    @palindromes
  end

  def largest
    PalindromeNumber.new(@palindromes.max) # needs to also return factors
  end

  def smallest
    PalindromeNumber.new(@palindromes.min)
  end
end

example = Palindromes.new(min_factor: 10, max_factor: 99)
example.generate
largest = example.largest
largest.value
