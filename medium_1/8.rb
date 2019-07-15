# Phone Number

# Do not accept less than 10 digits
# 10 digits is good
# 11 digits, first is 1, trim the 1, use the last 10
# 11 digits, first not 1, bad number
# more than 11 digits, bad number

class PhoneNumber
  def initialize(num)
    @num = num
  end

  def number
    err_num = '0000000000'
    return err_num if @num.match?(/[A-Za-z]/)
    
    raw_num = @num.scan(/\d/).join

    if raw_num.size == 11 && raw_num[0] == '1'
      raw_num[1..-1]
    elsif raw_num.size == 11 || raw_num.size < 10 || raw_num.size > 11
      err_num
    else
      raw_num
    end
  end

  def area_code
    self.number[0..2]
  end

  def to_s
    @num.size == 11 ? num = @num[1..-1] : num = @num

    "(#{num[0..2]}) #{num[3..5]}-#{num[6..9]}"
  end
end

p PhoneNumber.new('19137876164').to_s