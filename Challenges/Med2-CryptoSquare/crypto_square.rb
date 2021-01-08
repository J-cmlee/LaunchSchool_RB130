class Crypto
  attr_accessor :letters

  def initialize(text)
    @letters = text.downcase.scan(/[a-z0-9]/).join
  end

  def normalize_plaintext
    letters
  end

  def size
    Math.sqrt(@letters.size).ceil
  end

  def plaintext_segments
    letters.scan(/.{1,#{size}}/)
  end

  def ciphertext
    create_cipher.join
  end

  def normalize_ciphertext
    create_cipher.join(' ')
  end

  private

  def create_cipher
    cols = []
    (0...size).each do |index|
      cols << plaintext_segments.reduce('') { |ele, row| row[index].nil? ? ele : ele + row[index] }
    end
    cols
  end
end

# test = Crypto.new('Time is an illusion. Lunchtime doubly so.')
# p test.size
# p test.plaintext_segments
# p test.ciphertext
# p test.ciphertext == 'tasneyinicdsmiohooelntuillibsuuml'
