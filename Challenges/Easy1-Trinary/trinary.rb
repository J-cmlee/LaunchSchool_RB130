class Trinary
  attr_accessor :digits

  NOT_TRINARY = /\D|[3-9]/.freeze

  def initialize(value_string)
    @digits = value_string
  end

  def to_decimal
    digits =~ NOT_TRINARY ? 0 : calc_decimal
  end

  private

  def calc_decimal
    decimal = 0
    @digits.reverse.each_char.with_index do |char, index|
      decimal += char.to_i * (3**index)
    end
    decimal
  end
end

# test = Trinary.new('11')
# p test.to_decimal

class Trinary2
  def initialize(str)
    @trinary = str
  end

  def to_decimal
    return 0 if invalid_trinary?
    numbers = @trinary.reverse.chars.map(&:to_i)
    numbers.each_with_index.map { |num, idx| 3**idx * num }.inject(:+)
  end

  private

  def invalid_trinary?
    @trinary.match(/[^0-2]/)
  end
end