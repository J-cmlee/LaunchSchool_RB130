class House
  def self.recite
    output = ''
    (0...12).each do |index|
      output << 'This is ' + House.new.verse(index) + "\n\n"
    end
    output.chomp("\n")
  end

  def verse(index)
    return pieces.last.last + '.' if index.zero? # return last verse

    segments = pieces.reverse
    segments[index][0] + "\n" + segments[index][1] + ' ' + verse(index - 1)
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end

# p House.recite
