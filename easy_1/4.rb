class Trinary
  
  def initialize(num_string)
    @num_string = num_string
  end

  def to_decimal
    return 0 if invalid_trinary?

    base_10 = 0
    place = @num_string.size - 1
    @num_string.each_char do |char|
      base_10 += (char.to_i * (3 ** place))
      place -= 1
    end
    base_10
  end

  private

  def invalid_trinary?
    @num_string.match(/[^0-2]/)
  end
end

b = Trinary.new('1212110')
p b.to_decimal