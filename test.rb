# character set of letter, space, point
# words 1-20 chars
# input text, 1+ spaces, terminated 0+ spaces followed by point
# input starts from the first letter of the first word to the terminating point
# output should produces successive words by a single space, last word terminated by point
# odd words are reversed while even words are echoed
# "whats the matter with kansas." becomes "whats eht matter htiw kansas."

# Bonus: Characters read in one at a time and printed one at a time.

# Non-Bonus Solution
WORDREGEX = /\b[A-Za-z]+\b/.freeze

def stringfilter(text)
  raise StandardError if text =~ /[^A-Za-z. ]/
  return '' if text == ''

  words = text.scan(WORDREGEX)
  words.map.with_index { |word, index| index.odd? ? word.reverse : word }.join(' ') + '.'
end

# Bonus Solution
def readstring(text)
  word_array = []
  word = ''
  text.each_char do |char|
    if char =~ /[A-Za-z]/
      word << char
    elsif [' ', '.'].include?(char) && word != ''
      word_array << word
      word = ''
    end
  end
  word_array
end

def writestring(words)
  words.each_with_index do |word, index|
    if index.odd?
      (word.length-1).downto(0) { |idx| print word[idx] }
    else
      (0...word.length).each { |idx| print word[idx] }
    end
    if word == words.last
      print '.'
    else
      print ' '
    end
  end
end

def stringfilter2(text)
  words = readstring(text)
  writestring(words)
end

text = "     whats  the matter with kansas    ."
stringfilter2(text)
# p stringfilter('')
# p stringfilter('.')
# p stringfilter('word.')