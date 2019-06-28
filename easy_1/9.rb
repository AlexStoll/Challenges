# abundant, perfect, deficient categories

# perfect number == the sum of its divisors
# abundant - sum of factors > number
# deficient - sum of factors < number

class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number <= 0
    
    fact_sum = (1...number).select {|i| number % i == 0}.inject(:+)

    case
      when fact_sum < number then 'deficient'
      when fact_sum > number then 'abundant'
      when fact_sum == number then 'perfect'
    end
  end
end
