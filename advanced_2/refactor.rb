class Garden
  LETTER_TO_PLANT = { 'R' => :radishes, 'C' => :clover, 
                      'G' => :grass,'V' => :violets }

  def initialize(garden_string, students=default)
    students.sort!
    students.each_with_index do |student, idx|
      define_singleton_method("#{student.downcase}", plants_owned(garden_string, idx))
    end
  end

  def plants_owned(garden_string, idx)
    top, bottom = garden_string.split("\n")
    Proc.new do
      range = (idx * 2 )..((idx * 2) + 1)
      plants = top[range] + bottom[range]
      plants.chars.map { |letter| LETTER_TO_PLANT[letter] }
    end
  end

  def default
    ["alice", "bob", "charlie", "david", "eve", "fred", "ginny",
     "harriet", "ileana", "joseph", "kincaid", "larry"]
  end
end
