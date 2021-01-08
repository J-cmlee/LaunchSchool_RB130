class Robot
  @@names = []

  attr_accessor :serial

  def initialize
    @serial = nil
  end

  def name
    return serial unless serial.nil?

    loop do
      self.serial = generate_name
      break unless @@names.include?(serial)
    end
    @@names << serial
    serial
  end

  def reset
    @@names.delete(serial)
    self.serial = nil
  end

  private

  def generate_name
    seed = Random.new
    alpha_gen(seed.rand(25)) + alpha_gen(seed.rand(25)) +
      3.times.reduce('') { |acc, _| acc + num_gen(seed.rand(9)) }
  end

  def generate_name2
    name = ''
    loop do
      name = [*'AA'..'ZZ'].sample.concat([*'000'..'999'].sample)
      break unless @@robot_names.include?(name)
    end
    name
  end

  def alpha_gen(seed)
    alpha = ('A'..'Z').to_a
    alpha[seed]
  end

  def num_gen(seed)
    nums = (1..9).to_a.map(&:to_s)
    nums[seed]
  end
end

# robo = Robot.new
# p robo.name
# robo.reset
# p robo.name
