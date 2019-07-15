# Step One: Convert 
#  _   
# | |  
# |_| to "0"
#
# 
#   
# |  
# | 
#    to "1"

# OOO
# OOO
# OOO
# OOO

class OCR
  TABLE = {
    " _\n| |\n|_|\n" => '0',
    "\n  |\n  |\n"   => '1',
    " _\n _|\n|_\n"  => '2',
    " _\n _|\n _|\n" => '3',
    "\n|_|\n  |\n"   => '4',
    " _\n|_\n _|\n"  => '5',
    " _\n|_\n|_|\n"  => '6',
    " _\n  |\n  |\n" => '7',
    " _\n|_|\n|_|\n" => '8',
    " _\n|_|\n _|\n" => '9'
  }

  def initialize(text)
    @text = text
  end

  def convert
    output = TABLE[@text]||'?'
  end
end

text = <<-NUMBER.chomp
    _
  || |
  ||_|

    NUMBER
p text.split("\n")
