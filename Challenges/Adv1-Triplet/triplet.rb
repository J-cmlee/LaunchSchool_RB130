class Triplet
  attr_accessor :values

  def initialize(*values)
    @values = values.sort
  end

  def sum
    values.sum
  end

  def product
    values.reduce(&:*)
  end

  def pythagorean?
    values[0]**2 + values[1]**2 == values[2]**2
  end

  def self.where(params)
    params.key?(:min_factor) ? nil : params[:min_factor] = 1

    valid = generate_triplet(params[:min_factor], params[:max_factor]) 
    return valid unless params.key?(:sum)
    valid.select { |triplet| triplet.sum == params[:sum] }
  end

  def self.generate_triplet(min, max)
    valid = []
    (min..max - 2).each do |a|
      (a + 1..max - 1).each do |b|
        (b + 1..max).each do |c|
          test = new(a, b, c)
          valid << test if test.pythagorean?
        end
      end
    end
    valid
  end
end
