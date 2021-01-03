class Luhn
  def initialize(num)
    @num = num
  end

  def checksum
    addends.sum
  end

  def addends
    @num.digits.map.with_index do |d, i|
      next d unless i.odd?
      d > 4 ? d * 2 - 9 : d * 2
    end.reverse
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    n = number * 10
    new(n).valid? ? n : n + (10 - (new(n).checksum % 10))
  end
end