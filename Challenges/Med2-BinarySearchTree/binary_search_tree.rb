# frozen_string_literal: true

class Bst
  attr_accessor :data, :left, :right

  def initialize(data = nil)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(value)
    self.data = value if data.nil?
    if value <= data
      left.nil? ? self.left = Bst.new(value) : left.insert(value)
    else
      right.nil? ? self.right = Bst.new(value) : right.insert(value)
    end
  end

  def each(&block)
    return to_enum unless block_given?

    left&.each(&block)
    yield(data)
    right&.each(&block)
  end
end

# test = Bst.new(3)
# test.insert 2
# test.insert 4
# p test.data

# def record_all_data(bst)
#   all_data = []
#   bst.each { |data| all_data << data }
#   all_data
# end

# four = Bst.new 4
# p four
# four.insert 2
# four.insert 1
# p four.left.left
# four.insert 3
# four.insert 6
# four.insert 7
# four.insert 5
# p record_all_data(four)
