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
      blank_row = ' ' * (width * 2 - 1)
      blank_row[(blank_row.length - 1) / 2 - index] = diamond.letters[index] # left side
      blank_row[(blank_row.length - 1) / 2 + index] = diamond.letters[index] # right side
      output.concat(blank_row + "\n")

      flip = true if index == width - 1
      flip ? index -= 1 : index += 1
    end
    output
  end
end

# puts Diamond.make_diamond('C')
