# An individual palindromic number and its factors
class PalindromeNumber
  attr_accessor :value, :factors

  def initialize(array)
    @value = array[0]
    @factors = array[1].map(&:sort).uniq
  end
end

# Creates a list of palindromic numbers for a given range.
class Palindromes
  attr_accessor :palindromes

  def initialize(parameters)
    @min = parameters[:min_factor] || 1
    @max = parameters[:max_factor]
    @palindromes = Hash.new([])
  end

  def generate
    (@min..@max).each do |factor1|
      (@min..@max).each do |factor2|
        product = factor1 * factor2
        if product.to_s == product.to_s.reverse
          @palindromes[product] += [[factor1, factor2]]
        end
      end
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
