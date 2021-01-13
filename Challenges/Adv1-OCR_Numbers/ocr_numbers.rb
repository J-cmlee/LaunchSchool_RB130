class OCR
  OCR_HASH = {
    [' _ ', '| |', '|_|'] => '0',
    ["   ", "  |", "  |"] => '1',
    [" _ ", " _|", "|_ "] => '2',
    [" _ ", " _|", " _|"] => '3',
    ["   ", "|_|", "  |"] => '4',
    [" _ ", "|_ ", " _|"] => '5',
    [" _ ", "|_ ", "|_|"] => '6',
    [" _ ", "  |", "  |"] => '7',
    [" _ ", "|_|", "|_|"] => '8',
    [" _ ", "|_|", " _|"] => '9'
  }

  attr_accessor :rows, :lines

  def initialize(text)
    raise StandardError, 'wrong text dimensions' unless check_text(text)

    @lines = (text.count("\n") + 1) / 4
    @rows = text.split("\n").reject { |row| row == '' }.map { |row| row.scan(/.../) }
  end

  def convert
    value = ''
    (0...lines).each do |line_index|
      value << ',' if line_index > 0
      value << convert_row_to_digits((line_index * 3)..(line_index * 3 + 2))
    end
    value
  end

  private

  def check_text(text)
    ((text.count("\n") + 1) % 4).zero? &&
      text.split("\n").all? { |row| (row.size % 3).zero? }
  end

  def convert_row_to_digits(range)
    text = []
    columns = rows[range.to_a.first].length
    (0...columns).each do |col|
      digit = []
      (range).each do |row|
        digit << rows[row][col]
      end
      text << digit
    end
    text.map { |digit| OCR_HASH.key?(digit) ? OCR_HASH[digit] : '?' }.join
  end
end

# text = <<-NUMBER.chomp
#  _  _ 
# |_|| |
#  _||_|

#  _ 
# |_|
#  _|

#  _ 
# |_|
#  _|

#     NUMBER

# text2 = <<-NUMBER2.chomp
#  _  _  _ 
# |_|| |   
#  _||_|   

#   NUMBER2

# p OCR.new(text).convert
