

class Robot
  attr_reader :name
  @@names_given = []

  def initialize
    new_name = self.make_name
    until !@@names_given.include?(new_name) do
      new_name[4] = (0..9).select.to_s
    end
    @@names_given << new_name
    @name = new_name
  end

  def reset
    @name = self.make_name
  end

  protected

  def make_name
    "#{rand_lett}#{rand_lett}#{rand_num}#{rand_num}#{rand_num}"
  end

  private

  def rand_lett
    ('A'..'Z').to_a.sample
  end

  def rand_num
    (0..9).to_a.sample
  end
end
