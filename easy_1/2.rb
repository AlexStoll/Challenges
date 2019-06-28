# Algo
# Use an array
# (2..limit).to_a
# Take the next unmarked number on the list
# Mark all the multiples of that number (delete in this case)
# Repeate until each number has been processed
# Return primes


class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    list = (2..@limit).to_a
    list.each do |number|
      list.each do |candidate|
        list.delete(candidate) if (candidate % number == 0) && (candidate != number)
      end
    end
    list
  end
end
