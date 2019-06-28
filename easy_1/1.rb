# Take a string of digits and give all consecutive number series
# of length n in that string
# just return slices of that size, doesn't care if each slice is a series
# of consective numbers by value

class Series
  def initialize(num_string)
    @num_string = num_string
  end

  def slices(size)
    length_error_message = "Slice size must be smaller than string length."
    raise ArgumentError, length_error_message if size > @num_string.size
    
    output = []
    @num_string.chars.each_cons(size) { |i| output << i.map(&:to_i) }
    output
  end
end

# p Series.new('01234').slices(8) == [[0], [1], [2], [3], [4]]

# p Series.new('01234').slices(2) == [[0, 1], [1, 2], [2, 3], [3, 4]]