class PhoneNumber
  attr_reader :number

  BADNUM = '0000000000'.freeze

  def initialize(number)
    @number = filter(number) ? BADNUM : number.scan(/[0-9]/).map(&:to_s).join
    @number.delete_prefix!('1') if @number[0] == '1' && @number.size == 11
    @number = BADNUM if @number.size != 10
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{area_code}) #{number[3..5]}-#{number[6..9]}"
  end

  private

  def filter(number)
    number =~ /[^\s.0-9()-]/
  end
end

# p PhoneNumber.new('1234567890').to_s
