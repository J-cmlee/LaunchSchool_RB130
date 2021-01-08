class Triangle
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def rows
    tree = [[1]]
    (1...value).each do |_|
      row = [1]
      prev_row = tree.last
      (0...prev_row.length - 1).each do |index|
        row << prev_row[index] + prev_row[index + 1]
      end
      row << 1
      tree << row
    end
    tree
  end
end

# p Triangle.new(20).rows.last