# Hamming distance between two DNA strands
# Count the differences over two strands
# If one strand longer, chop it and then calculate
# based on the now equal-length strands

# algo
# loop through with an index and compare the two
# iterate a counter when they're not the same

class DNA
  def initialize(sequence)
    @sequence = sequence
  end

  def hamming_distance(other_sequence)
    distance = 0
    idx = 0
    until (idx >= @sequence.length) || (idx >= other_sequence.length) do
      distance += 1 if @sequence.chars[idx] != other_sequence.chars[idx]
      idx += 1
    end
    distance
  end
end

a = DNA.new('ABCDEFG')
p a.hamming_distance('ABCDE')
