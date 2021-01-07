class Prime
  def self.nth(num)
    raise ArgumentError if num < 1
    primes = []
    n = 2
    until primes.length == num
      primes << n if 2.upto(Math.sqrt(n)).none? { |x| n % x == 0 }
      n += 1
    end
    primes.last
  end
end