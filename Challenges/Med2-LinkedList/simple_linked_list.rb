# frozen_string_literal: true

class Element
  attr_accessor :datum, :next

  def initialize(value, prev = nil)
    @datum = value
    @next = prev
  end

  def tail?
    self.next.nil?
  end
end

class SimpleLinkedList
  attr_accessor :size, :head

  def initialize
    @size = 0
    @head = nil
  end

  def empty?
    size.zero?
  end

  def push(value)
    self.size += 1
    node = Element.new(value, head)
    self.head = node
  end

  def peek
    head&.datum
  end

  def pop
    self.size -= 1
    value = head.datum
    self.head = head.next
    value
  end

  def self.from_a(array)
    list = new
    array&.reverse&.each { |ele| list.push(ele) }
    list
  end

  def to_a
    array = []
    array << pop until empty?
    array
  end

  def reverse
    self.class.from_a(to_a.reverse)
  end
end
