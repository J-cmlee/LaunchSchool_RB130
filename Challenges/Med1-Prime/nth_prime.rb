require 'prime'

ERROR_MESSAGE = <<-MSG.freeze
Using Ruby's Prime class is probably the best way to do this in a
'real' application; but this is an exercise, not a real application,
so you're expected to implement this yourself.
MSG

# This code prevents you from using any of the prohibited methods.

class Prime
  [:each, :new, :prime?, :take].each do |m|
    define_method(m) { |*_| fail ERROR_MESSAGE }
  end

  def self.nth(value)
    raise ArgumentError if value <= 0

    prime_array = [2]
    index = 2
    while prime_array.length < value
      index += 1
      is_prime = true
      upper_limit = Math.sqrt(index).to_i
      prime_array.each do |prime|
        is_prime = false if (index % prime).zero?
        break if prime > upper_limit
      end
      prime_array << index if is_prime
    end
    prime_array.last
  end
end

class Integer
  [:prime?, :each_prime].each do |m|
    define_method(m) { |*_| fail ERROR_MESSAGE }
  end
end

# p Prime.nth(10000)