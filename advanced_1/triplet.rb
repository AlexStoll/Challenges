# Py Triplet is a set of three numbers for which
# a**2 + b**2 = c** 2

# In other words, a, b and c represent
# valid side lengths for a right triangle

# where method
# takes a max facotr number
# creates an array, of arrays, of triplets
# Triplet.where(max_factor: 5) => [[3, 4, 5]]
# Triplet.where(max_factor: 10) => [[3, 4, 5], [x, x, x]]

class Triplet
  attr_reader :a, :b, :c

  def initialize(*numbers)
    @a, @b, @c = numbers[0], numbers[1], numbers[2]
  end

  def sum
    a + b + c
  end

  def product
    a * b * c
  end

  def pythagorean?
    (a**2) + (b**2) == (c**2)
  end

  def self.where(options)
    result = []
    max = options[:max_factor] || 10
    min = options[:min_factor] || 1
    sum = options[:sum]

    combinations((min..max).to_a).each do |combo|
      candidate = Triplet.new(combo[0], combo[1], combo[2])

      if candidate.pythagorean?
        if sum 
          result << candidate if candidate.sum == sum
        else
          result << candidate
        end
      end
    end
    sum == nil ? result : (result.select { |trip| trip.sum == sum })
  end

  def self.combinations(arr)
    arr.product(arr)
       .product(arr)
       .map(&:flatten)
       .map(&:sort)
       .uniq
  end
end

p Triplet.where(min_factor: 11, max_factor: 20)





