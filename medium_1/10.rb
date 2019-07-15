# Write a program that can tell you what the nth prime is
# Can't use prime or fancy Integer methods
# 

class Prime
  def self.nth(num)
    raise ArgumentError if num == 0
    nth = 1
    current = 2
    until nth == num do
      current += 1
      next if current.even?
      limit = Math.sqrt(current).floor
      nth += 1 if (2..limit).all? { |i| current % i != 0}
    end
    current
  end
end

p Prime.nth(1)