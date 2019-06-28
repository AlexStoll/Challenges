# Luhn Algorithm
# a 'checksum' formula used to validate ID numbers,
# such as credit cars, Social Security

# It verifies a number against its included 'check digit'
# the 'check digit' is usually appended to a partial
# number to generate the full number

# Counting from the rightmost digit (the check digit)
# => double the value of every second digit
#   12345 becomes 24385
# => if a digit becomes 10 or more, subtract 9 before appending
#   1111 becomes 2121
#   8763 becomes 7733
# =>  2 * 8 = 16 => 16 - 9 => 7, 7 => 7, 2 * 6 = 12 => 12 - 9 => 3, 3 => 3
# => So,      7                     7                   3              3
# => 7733

# Then add all of the digits together
# 1111 => 2121 => 6, the checksum, is not valid
# 8763 => 7733 => 20, the checksum, is valid

# Valid number if the total ends in 0 (so if total % 10 == 0)

# Write program to check if the num is valid
# Return the checksum

class Luhn
  def initialize(num)
    @num = num
  end

  def addends
    # this does the digit doubling, returns an array of digits
    @num.digits.map.with_index do |digit, index|
      if index.even?
        digit
      else
        item = digit * 2
        item > 9 ? item - 9 : item
      end
    end.reverse
  end

  def checksum
    self.addends.inject(:+)
  end

  def valid?
    self.checksum % 10 == 0
  end

  def self.create(num)
    return num if self.new(num).valid?

    (0..9).to_a.each do |digit|
      candidate = num.digits.reverse.push(digit).join.to_i
      return candidate if self.new(candidate).valid?
    end
  end
end
