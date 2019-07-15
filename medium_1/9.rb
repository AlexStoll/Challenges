class Clock
  attr_accessor :bulk_minutes, :hour, :minute

  def initialize(hour, minute)
    @bulk_minutes = (hour * 60 + minute) % 1440
    @hour, @minute = bulk_minutes.divmod(60)
  end

  def self.at(hour, minute=0)
    Clock.new(hour, minute)
  end

  def +(num)
    Clock.new(0, bulk_minutes + num)
  end

  def -(num)
    Clock.new(0, bulk_minutes - num)
  end 

  def to_s
    format("%02d:%02d", hour, minute)
  end

  def ==(other_clock)
    self.bulk_minutes == other_clock.bulk_minutes
  end
end