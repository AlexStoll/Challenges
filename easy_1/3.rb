# Take an octal input string
# Return a decimal output

# Decimal is base-10
# Octal is base-8

# 234 in base 10 is a linear combination of powers of 10
# (4 * (10 ** 0)) + (3 * (10 ** 1)) + (2 * (10 ** 2))

# Octal just uses 8 in place of 10
# 234 in base 8 is a linear combination of powers of 8
# (4 * (8 ** 0)) + (3 * (8 ** 1)) + (2 * (8 ** 2))
#       4        +      24        +      128
#                      156 in base 10

# 1234
# Split that into characters
# Then 1 * (8 ** 4) etc

class Octal
  def initialize(num_string)
    @num_string = num_string
  end

  def to_decimal
    base_10 = 0
    place = @num_string.size - 1

    @num_string.each_char do |char|
      return 0 if (char.to_i.to_s != char || char == '8' || char == '9')
      base_10 += (char.to_i * (8 ** place))
      place -= 1
    end

    base_10
  end
end