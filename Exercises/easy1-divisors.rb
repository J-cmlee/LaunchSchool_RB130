def divisors(value)
  result = []
  1.upto(value/2) do |idx|
    result << idx if (value % idx).zero?
  end
  result << value
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

def divisors2(number)
  1.upto(number).select do |candidate|
    number % candidate == 0
  end
end