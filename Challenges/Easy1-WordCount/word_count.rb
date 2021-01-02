class Phrase
  attr_reader :words
  def initialize(words)
    @words = words.downcase.gsub(/'t/, 'A').gsub(/([^0-9a-zA])/, ' ').gsub('A', "'t").split(' ')
  end

  def word_count
    count = Hash.new(0)
    words.each { |word| count[word] += 1 }
    count
  end
end

class Phrase2
  def initialize(words)
    @words = words
  end

  def word_count
    count = Hash.new(0)

    @words.scan(/\b[\w']+\b/) do |word|
      count[word.downcase] += 1
    end

    count
  end
end