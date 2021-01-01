class Sieve
  attr_accessor :numbers

  def initialize(size)
    values = (2..size).to_a
    @numbers = values.map { |value| [value, false] }
  end

  def primes
    numbers.each { |number| mark_multiple(number[0]) if number[1] == false }
    numbers.select { |number| number[1] == false }.map { |number| number[0] }
  end

  private

  def mark_multiple(value)
    numbers.each do |number|
      next if number[0] == value

      number[1] = true if (number[0] % value).zero?
    end
  end
end

# test = Sieve.new(10)
# p test.numbers
# p test.primes

class Sieve2
  attr_reader :range

  def initialize(last_num)
    @range = (2..last_num).to_a
  end

  def primes
    range.each do |prime|
      range.reject! { |num| (num != prime) && (num % prime == 0) }
    end
    range
  end

end