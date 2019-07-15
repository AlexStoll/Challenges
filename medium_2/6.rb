# Run length encoding
# Runs of consecutive elements are replaced by a count
# followed by a single instance of that element
# "AAABBBCDDDD" becomes "3A3BC4D"
# "JJJJJJJJJJ" becomes "10J"

class RunLengthEncoding
  def self.encode(input)
    result = ""
    count = 1
    last = ""
    input.chars.each_cons(2) do |first, second|
      if first == second
        count += 1 
      else
        result << count.to_s if count != 1
        result << first
        count = 1
      end
      last = second
    end
    result << count.to_s if count != 1
    result << last
  end

  def self.decode(input)
    output = ""
    num = 1
    input.chars.each do |char|
      if char.to_i != 0
        num += char.to_i
      else
        output << char * num
        num = 1
      end
    end
    output
  end
end

p RunLengthEncoding.decode("10A5BC")