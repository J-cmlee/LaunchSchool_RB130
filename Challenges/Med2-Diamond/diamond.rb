class Diamond
  attr_accessor :letters

  def initialize(letter)
    @letters = ('A'..letter).to_a
  end

  def self.make_diamond(letter)
    diamond = Diamond.new(letter)
    width = diamond.letters.size
    index = 0
    output = ''
    flip = false
    while index >= 0
      output.concat(diamond.make_row(index) + "\n")
      flip = true if index == width - 1
      flip ? index -= 1 : index += 1
    end
    output
  end

  def make_row(index)
    row = ' ' * (letters.size * 2 - 1)
    row[calc_left(index)] = letters[index] # left side
    row[calc_right(index)] = letters[index] # right side
    row
  end

  private

  def calc_left(index)
    letters.size - 1 - index
  end

  def calc_right(index)
    letters.size - 1 + index
  end
end

puts Diamond.make_diamond('C')
