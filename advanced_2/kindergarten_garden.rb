class Garden
  LETTER_TO_PLANT = {'R' => :radishes, 
                     'C' => :clover,
                     'G' => :grass,
                     'V' => :violets
                    }


  def initialize(garden_string, students=self.default)
    @garden_string = garden_string
    students.sort!

    students.size.times do |i|
      student = students[i]
      Garden.create_method("#{student.downcase}", self.plants_owned(@garden_string, i))
    end
  end

  def self.create_method(name, block)
    define_method(name, &block)
  end

  def plants_owned(garden_string, n)
    top, bottom = garden_string.split("\n")

    Proc.new do
      range = (n * 2 )..((n * 2) + 1)
      plants = top[range] + bottom[range]
      plants.chars.map { |letter| LETTER_TO_PLANT[letter] }
    end
  end

  def default
    ["alice", "bob", "charlie", "david", "eve",
     "fred", "ginny", "harriet", "ileana",
     "joseph", "kincaid", "larry"]
  end
  
end

Garden.new("VVCCGG\nVVCCGG", ["joe", "andre", "tony"]).joe
