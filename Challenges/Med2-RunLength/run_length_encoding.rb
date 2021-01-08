class RunLengthEncoding
  def self.encode(text)
    blocks = []
    block = ''
    text.each_char do |char|
      if block == '' || char == block[0]
        block.concat(char)
      else
        blocks << block
        block = char
      end
    end
    blocks << block
    blocks.map do |ele|
      ele.length == 1 ? ele : ele.length.to_s.concat(ele[0])
    end.join
  end

  def self.decode(text)
    blocks = text.scan(/\D|\d+/)
    output = ''
    until blocks.empty?
      block = blocks.shift
      block =~ /\d+/ ? output << blocks.shift * block.to_i : output << block
    end
    output
  end
end

# p RunLengthEncoding.encode('AABBCCC')
# p RunLengthEncoding.decode('12A3V')
# p test = RunLengthEncoding.encode('ABCCC ')
# p RunLengthEncoding.decode(test)

module RunLengthEncoding2
  def self.encode(input)
    input.gsub(/(.)\1{1,}/) { |match| match.size.to_s + match[0] }
  end

  def self.decode(input)
    input.gsub(/\d+\D/) { |match| match[-1] * match.to_i }
  end
end