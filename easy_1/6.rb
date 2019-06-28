class Anagram
  def initialize(word)
    @word = word
    @sort_word = word.downcase.chars.sort.join
  end

  def match(list)
    matches = list.select do |item| 
      @sort_word == item.downcase.chars.sort.join && 
                      item.downcase != @word.downcase
    end
  end
  
end

