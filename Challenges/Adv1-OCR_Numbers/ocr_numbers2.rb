class OCR
  DIGITS = { [' _ ', '| |', '|_|'] => 0,    ['   ', '  |', '  |'] => 1,
             [' _ ', ' _|', '|_ '] => 2,    [' _ ', ' _|', ' _|'] => 3,
             ['   ', '|_|', '  |'] => 4,    [' _ ', '|_ ', ' _|'] => 5,
             [' _ ', '|_ ', '|_|'] => 6,    [' _ ', '  |', '  |'] => 7,
             [' _ ', '|_|', '|_|'] => 8,    [' _ ', '|_|', ' _|'] => 9 }

  def initialize(str)
    @str = str
  end

  def convert
    @str.split("\n\n").map { |row| convert_row(row) }.join(',')
  end

  private

  def convert_row(row)
    rows = row.split("\n")
    size = rows.max_by(&:size).size

    split_rows = rows.map { |line| line.ljust(size).scan(/.../) }
    split_rows.transpose.map { |num| DIGITS.fetch(num, '?') }.join
  end
end