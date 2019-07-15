# @cipher = Cipher.new
# @cipher.encode("iamapandabear") #=> "ldpdsdqgdehdu"
# @cipher.decode("ldpdsdqgdehdu") #=> "iamapandabear"

# ('a'..'z').to_a.sample => random letter
# 'c' is the key
# 'f' is the letter to decode
# 'c'.ord - 97 = 2
# ('f'.ord + 2).chr
# so
# ('coded'.ord + ('key'.ord - 97)) => decoded
# 
# ascii lowercase are 97..122
# "a".ord == 97
# 97.chr == "a"

class Cipher
  attr_reader :key

  def initialize(key=Cipher.generate_key)
    raise ArgumentError if key.match?(/[^a-z]/) || key.empty?
    @key = key
  end

  def decode(text)
    text.chars.map.with_index do |char, idx|
      num = (char.ord - (@key[idx].ord - 97))
      num < 97 ? (num + 26).chr : num.chr
    end.join
  end

  def encode(text)
    text.chars.map.with_index do |char, idx|
      num = (char.ord + (@key[idx].ord - 97))
      num > 122 ? (num - 26).chr : num.chr
    end.join
  end

  private

  def self.generate_key
    (0..100).to_a.map { ('a'..'z').to_a.sample }.join
  end
end