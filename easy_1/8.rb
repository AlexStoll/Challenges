# Write a program that given a phrase
# can count the occurences of each word in that phrase

# "olly olly in come free" =>
# olly: 2
# in: 1
# come: 1
# free: 1

# apostrophes
# s
# 


class Phrase
  attr_reader :words
  def initialize(phrase)
    @phrase = phrase
    @words = phrase.downcase
                   .gsub(/[,\s]/, ' ')
                   .gsub(/[^\w\s']/, "")
                   .squeeze(' ')
                   .split(' ')
                   
  end

  def word_count
    counts = {}
    @words.uniq.each { |uniq| counts[uniq] = @words.count(uniq) }
    counts
  end
end

p Phrase.new("Joe can't tell between 'large' and large.").word_count

