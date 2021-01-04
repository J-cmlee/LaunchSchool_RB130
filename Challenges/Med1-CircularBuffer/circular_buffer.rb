class CircularBuffer
  class BufferEmptyException < StandardError; end

  class BufferFullException < StandardError; end

  attr_accessor :queue
  attr_reader :size

  def initialize(size)
    @queue = []
    @size = size
  end

  def write(value)
    raise BufferFullException if queue.length == size

    return nil if value.nil?
    
    queue << value
  end

  def write!(value)
    return nil if value.nil?
    
    queue << value
    queue.shift if queue.length > size
  end

  def read
    raise BufferEmptyException if queue.empty?

    queue.shift
  end

  def clear
    self.queue = []
  end
end

# buffer = CircularBuffer.new(2)
# ('1'..'2').each { |i| buffer.write i }
# buffer.write! nil
