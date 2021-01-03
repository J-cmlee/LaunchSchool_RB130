class Luhn
  attr_reader :digits

  def initialize(digits)
    @digits = digits.to_s.split('').map(&:to_i)
  end

  def self.addends(new_digits)
    new_digits.reverse!
    0.upto(new_digits.length - 1) do |index|
      if index.odd?
        new_digits[index] *= 2
        new_digits[index] -= 9 if new_digits[index] > 9
      end
    end
    new_digits.reverse!
  end

  def addends
    self.class.addends(digits.clone)
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum.to_s[-1] == '0'
  end

  def self.create(input)
    digits = input.to_s.split('').map(&:to_i)
    new_digits = digits.clone
    new_digits << 0
    lastdigit = 10 - addends(new_digits).sum.to_s[-1].to_i
    lastdigit = 0 if lastdigit == 10
    digits.clone.push(lastdigit).join.to_i
  end
end

# p Luhn.new(8631).addends
# p Luhn.new(4913).checksum
# p Luhn.new(8_739_567).valid?
# p Luhn.create(873956)
