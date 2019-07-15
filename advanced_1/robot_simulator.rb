# Three movements, turn right, left, advance
# Robot is placed on a grid with some x, y position
# Given instructions of moves and turns
# Return final position and orientation

class Simulator
  INSTRUCTIONS = { 'L' => :turn_left,
                   'R' => :turn_right,
                   'A' => :advance 
                 }

  def place(robot, x: 0, y: 0, direction: nil)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, string)
    instructions(string).each { |instruction| robot.send(instruction) }
  end

  def instructions(string)
    string.chars.map {|char| INSTRUCTIONS[char]}
  end
end

class Robot
  attr_accessor :bearing, :x, :y
  BEARINGS = [:north, :east, :south, :west]

  def initialize
    @bearing = nil
    @coordinates = [nil, nil]
  end

  def at(x, y)
    @x, @y = x, y
  end

  def coordinates
    [self.x, self.y]
  end

  def advance
    case self.bearing
      when :north then @y += 1
      when :south then @y -= 1
      when :east  then @x += 1
      when :west  then @x -= 1
    end
  end

  def orient(bearing)
    raise ArgumentError unless BEARINGS.include?(bearing)
    @bearing = bearing
  end

  def turn_right
    self.bearing = BEARINGS[(BEARINGS.index(@bearing) + 1) % 4]
  end

  def turn_left
    self.bearing = BEARINGS[(BEARINGS.index(@bearing) - 1) % 4]
  end
end