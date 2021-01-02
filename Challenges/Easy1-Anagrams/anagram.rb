class Anagram
  attr_reader :letters, :orig_word

  def initialize(word)
    @orig_word = word.downcase
    @letters = reduce(word)
  end

  def match(words)
    words.select { |word| letters == reduce(word) && word.downcase != orig_word }
  end

  private

  def reduce(word)
    word.downcase.split('').sort
  end
end