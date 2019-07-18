require 'regexp-examples'

class Robot
  attr_reader :name
  @@names_given = []

  def initialize
    @name = make_name
    until !@@names_given.include?(@name)
      @name = make_name
    end
    @@names_given << @name
  end

  def reset
    @name = self.make_name
  end

  protected

  def make_name
    /[A-Z]{2}[0-9]{3}/.random_example
  end
end
