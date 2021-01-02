class DNA
  attr_reader :original

  def initialize(strand)
    @original = strand
  end

  def hamming_distance(strand)
    count = 0
    # determine shortest strand
    length = strand.length > original.length ? original.length : strand.length
    (0...length).each do |index|
      count += 1 if strand[index] != original[index]
    end
    count
  end
end