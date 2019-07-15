# Crypto Square

# Normalize the input: Spaces and punctuation are removed and
# the message is down cased

# Normalized characters are broken into rows to form a rectangle
# Want to get as close to a square (ex. 8 lines by 8 chars) as possible
# 54 chars => 7 rows of 8 character columns


class Crypto
  def initialize(message)
    @message = message
  end

  def normalize_plaintext
    @message.downcase.gsub(/[^a-z0-9]/, '')
  end

  def size # how many rows
    Math.sqrt(normalize_plaintext.length).ceil
  end

  def plaintext_segments
    normalize_plaintext.chars.each_slice(size).map { |slice| slice.join }
  end

  def ciphertext
    ciphered_strings_arr.join
  end

  def normalize_ciphertext
    ciphered_strings_arr.join(' ')
  end

  private

  def ciphered_strings_arr
    output = []
    size.times do |idx|
      word = ''
      plaintext_segments.each do |segment|
        word << segment.chars[idx] if segment.chars[idx]
      end
      output << word
    end
    output
  end
end

p Crypto.new('abcdabcdabcdab').normalize_ciphertext


