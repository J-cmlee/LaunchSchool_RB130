# character set of letter, space, point
# words 1-20 chars
# input text, 1+ spaces, terminated 0+ spaces followed by point
# input starts from the first letter of the first word to the terminating point
# output should produces successive words by a single space, last word terminated by point
# odd words are reversed while even words are echoed
# "whats the matter with kansas." becomes "whats eht matter htiw kansas."

# Bonus: Characters read in one at a time and printed one at a time.

# Non-Bonus Solution
WORDREGEX = /\b[A-Za-z]+\b/

def stringfilter(text)
  raise StandardError if text =~ /[^A-Za-z. ]/
  return '' if text == ''

  words = text.scan(WORDREGEX)
  words.map { |word| word.length.odd? ? word.reverse : word }.join(' ') + '.'
end

# Bonus Solution
def readstring(text)
  word_array = []
  word = ''
  text.each_char do |char|
    if char =~ /[A-Za-z]/
      word << char
    elsif char == ' ' && word != ''
      word_array << word
      word = ''
    end
  end
  word_array
end

def writestring(words)
  words.each do |word|
    if word.length.odd?
      (word.length-1).downto(0) { |index| print word[index] }
    else
      (0...word.length).each { |index| print word[index] }
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

text = "     whats  a  the matter with kansas   ."
p stringfilter(text)
p stringfilter('')
p stringfilter('.')
p stringfilter('word.')