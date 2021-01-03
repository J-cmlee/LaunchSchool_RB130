class SecretHandshake
  attr_accessor :code
  def initialize(code)
    @code = if code.is_a?(String)
              code.scan(/^[0-9]+$/).first.to_i.to_s.split('').reverse
            elsif code.is_a?(Integer)
              code.to_s(2).to_s.split('').reverse
            else
              '0'
            end
  end

  def commands
    output = []
    decode_key = ['wink', 'double blink', 'close your eyes', 'jump']
    code.each_with_index { |ele, index| output << decode_key[index] if ele == '1' }
    if output.last.nil?
      output.pop
      output.reverse!
    end
    output
  end
end

# p SecretHandshake.new('10011').commands