class Integer
  def plus(other)
    self + other
  end

  def minus(other)
    self - other
  end

  def multiplied(other)
    self * other
  end

  def divided(other)
    self / other
  end
end

class WordProblem
  attr_accessor :text

  ALLOWED = %w[What is plus minus multiplied divided by].freeze

  def initialize(text)
    @text = text.gsub(/\?$/, '').split(' ')
    @text.each do |word|
      raise ArgumentError unless ALLOWED.include?(word) || word =~ /[0-9]+/
    end
    %w[What is by].each { |word| @text.delete(word) }
  end

  def answer
    value = text.shift.to_i
    value = value.send(text.shift, text.shift.to_i) until text.empty?
    value
  end
end

# test = WordProblem.new('What is 1 multiplied 50 plus 2?')
# p test.answer
