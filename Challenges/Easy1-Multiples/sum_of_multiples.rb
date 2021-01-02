class SumOfMultiples
  attr_accessor :multiples

  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(limit)
    multiples = [3, 5]
    calc_multiples(limit, multiples)
  end

  def to(limit)
    self.class.calc_multiples(limit, @multiples)
  end

  def self.calc_multiples(limit, multiples)
    sum = 0
    1.upto(limit - 1) do |value|
      sum += value if multiples.any? { |multiple| (value % multiple).zero? }
    end
    sum
  end
end

# p SumOfMultiples.to(9)

class SumOfMultiples2
  def self.to(limit, multiples = [3, 5])
    (0...limit).select do |number|
      multiples.any? { |multiple| number % multiple == 0 }
    end.reduce(:+)
  end

  def initialize(*multiples)
    @multiples = multiples
  end

  def to(limit)
    self.class.to(limit, @multiples)
  end
end