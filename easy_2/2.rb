# Write a program that, given a word, computes
# The scrabble score for that word.

# Maybe a hash with letters in arrays
# {['f', 'h', 'v', 'w', 'y'] => 4, ['j', 'x'] => 8, etc}

# Maybe just a big case statement
# case
# when ['f', 'h', 'v', 'w', 'y'].includes?(letter) then score = 4
# etc


class Scrabble
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    return 0 unless word
    score = 0
    word.upcase.each_char {|char| score += letter_score(char) }
    score
  end

  private

  def letter_score(letter)
    case
    when %w(A E I O U L N R S T).include?(letter) then 1
    when %w(D G).include?(letter)                 then 2
    when %w(B C M P).include?(letter)             then 3
    when %w(F H V W Y).include?(letter)           then 4
    when letter == 'K'                            then 5
    when %w(J X).include?(letter)                 then 8
    when %w(Q Z).include?(letter)                 then 10
    else 0
    end
  end
end


p b = Scrabble.new(" dog").score

