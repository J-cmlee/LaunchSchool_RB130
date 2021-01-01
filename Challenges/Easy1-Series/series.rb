class Series
  attr_accessor :digits

  def initialize(num_string)
    @digits = num_string.split('').map(&:to_i)
  end

  def slices(size)
    raise ArgumentError, 'slice is larger than series size' if size > @digits.size
    digits.each_cons(size).to_a

    # output = []
    # 0.upto(@digits.size - size) do |idx|
    #   output << @digits[idx..(idx + size - 1)]
    # end
    # output
  end
end
