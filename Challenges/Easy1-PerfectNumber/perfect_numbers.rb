class PerfectNumber
  def self.classify(value)
    raise StandardError, 'must be a positive integer' if value < 1

    case find_factors(value).sum <=> value
    when 1 then 'abundant'
    when -1 then 'deficient'
    else 'perfect'
    end
  end

  def self.find_factors(value)
    (1...value).select { |number| (value % number).zero? }
  end
end

# p PerfectNumber.classify(7)