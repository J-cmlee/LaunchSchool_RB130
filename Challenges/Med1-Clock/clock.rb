class Clock
  attr_accessor :hour, :minute

  HOURS_IN_DAY = 24
  MIN_IN_HOUR = 60

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute = 0)
    new(hour, minute)
  end

  def to_s
    format('%02d:%02d', hour, minute)
  end

  def +(increment)
    self.minute += increment
    while self.minute > MIN_IN_HOUR
      self.minute -= MIN_IN_HOUR
      self.hour += 1
    end
    self.hour -= HOURS_IN_DAY while self.hour >= HOURS_IN_DAY
    self
  end

  def -(increment)
    self.minute -= increment
    while self.minute.negative?
      self.minute += MIN_IN_HOUR
      self.hour -= 1
    end
    self.hour += HOURS_IN_DAY while self.hour.negative?
    self
  end

  def ==(other)
    to_s == other.to_s
  end
end
