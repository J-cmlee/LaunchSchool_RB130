class Element
  attr_accessor :datum, :next, :prev

  def initialize(value, prev = nil)
    @datum = value
    @prev = prev
    @prev ? prev.next = self : nil
  end

  def tail?
    self.next.nil?
  end
end

class SimpleLinkedList
  attr_reader :size, :head, :tail

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def empty?
    head.nil?
  end

  def push(value)
    if empty?
      self.head = Element.new(value)
      self.tail = head
    else
      self.tail = Element.new(value, tail)
    end
    @size += 1
    tail
  end

  def peek
    head&.datum
  end

  def pop
    return ArgumentError, 'list is empty' if size.zero?

    self.size -= 1
    value = tail.datum
    if tail.prev.nil?
      self.head = nil
      self.tail = nil
    else
      self.tail = tail.prev
      tail.next = nil
    end
    value
  end

  def self.from_a(array)
    return new if array.nil?

    list = new
    array.each { |ele| list.push(ele) }
    list
  end

  def to_a
    return [] if size.zero?

    list = []
    current = head
    loop do
      list << current.datum
      break if current.next.nil?

      current = current.next
    end
    list
  end

  def reverse
    self.class.from_a(to_a.reverse)
  end

  private

  attr_writer :size, :head, :tail
end


test = SimpleLinkedList.from_a((1..10).to_a)
p test.size
p test.reverse.to_a