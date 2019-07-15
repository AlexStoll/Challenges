# Pascals triangle
# Add one position to each row
# That position is equal to the sum of the two values above it
# 1       1
# 2      1 1
# 3     1 2 1
# 4    1 3 3 1
# 5   1 4 6 4 1
# 6  1 5 etc...

# [1], [1, 1]




class Triangle
  attr_reader :rows

  def initialize(height)
    @rows = (1..height).map { row }
  end

  def row
    bottom_row = @previous_row ? [0, *@previous_row, 0] : [0, 1]
    @previous_row = bottom_row.each_cons(2).map { |left, right| left + right }
  end

end

single = Triangle.new(6)
p single.rows