class Octal
  attr_accessor :value

  def initialize(string_value)
    @value = string_value.split('').reverse
    @value = [0] unless @value.all? { |digit| digit =~ /[0-7]/ }
    @value.map!(&:to_i)
  end

  def to_decimal
    sum = 0
    0.upto(value.size - 1) do |index|
      return 0 if value[index] > 7

      sum += value[index] * (8**index)
    end
    sum
  end
end

# test = Octal.new('130')
# p test.value
# p test.to_decimal

class Octal2
  BASE = 8
  INVALID_OCTAL = /\D|[8-9]/

  attr_reader :octal_string

  def initialize(octal_string)
    @octal_string = octal_string
  end

  def to_decimal
    octal_string =~ INVALID_OCTAL ? 0 : calculate
  end

  private

  def calculate
    decimal = 0
    octal_string.reverse.each_char.with_index do |char, index|
      decimal += char.to_i * (BASE ** index)
    end
    decimal
  end

end