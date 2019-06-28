# REDO THIS WITH REGEX



# Pig Latin machine

# Rule 1: If a word begins with a vowel, just add 'ay' to the end
# Rule 2: If a word begins with consonants, move them to the end
# then add an 'ay' to the end

# 'apple' => 'appleay'
# 'ear'   => 'earay'
# 'pig'   => 'igpay'
# 'koala' => 'oalakay'
# 'chair' => 'airchay'

# So, if it starts with a vowel, just add 'ay' and call it good
# If not, go over the chars until a vowel encountered
# add that chunk to the end, then add 'ay'

class PigLatin
  VOWELS = ['a', 'e', 'i', 'o', 'u']

  def self.translate(string)
    string.split(' ').map do |word|
      chars = word.chars
      if [['y', 't'], ['x', 'r']].include?(chars[0..1])
        return (chars << 'ay').join
      elsif VOWELS.include?(chars[0])
        return (chars << 'ay').join
      end

      leading_consonants = []
      until VOWELS.include?(chars[0])
        letter = chars.shift
        leading_consonants << letter
        if letter == 'q' && chars[0] == 'u'
          leading_consonants << chars.shift
          break
        end
      end

      chars.join + leading_consonants.join + 'ay'
    end.join(' ')
  end
end

p PigLatin.translate('quary house')
p PigLatin.translate('dog')
p PigLatin.translate('outside')