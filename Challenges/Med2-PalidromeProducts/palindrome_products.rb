class Palindrome
  attr_reader :value, :limits

  def initialize(value, limits)
    @value = value
    @limits = limits
  end

  def factors
    list = []
    lower = limits[:min_factor]
    upper = limits[:max_factor]
    (lower..upper).each do |factor|
      list << [factor, value / factor] if (value % factor).zero?
    end
    list
  end
end

class Palindromes
  attr_accessor :limits, :list

  def initialize(*limits)
    @limits = limits.first
    @limits[:min_factor] = 1 unless @limits.key?(:min_factor)
    @list = []
  end

  def generate
    lower = @limits[:min_factor]
    upper = @limits[:max_factor]
    (lower..upper).each do |value1|
      (lower..upper).each do |value2|
        product = value1 * value2
        list << product if product.to_s == product.to_s.reverse && !list.include?(product)
      end
    end
  end

  def largest
    Palindrome.new(list.last, limits)
  end

  def smallest
    Palindrome.new(list.first, limits)
  end
end

test = Palindromes.new(max_factor: 99, min_factor: 10)
test.generate
p test.largest.factors