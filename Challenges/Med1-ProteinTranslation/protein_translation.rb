class InvalidCodonError < StandardError; end

class Translation

  CODONS = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine', 'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine', 'UUG' => 'Leucine',
    'UCU' => 'Serine', 'UCC' => 'Serine', 'UCA' => 'Serine', 'UCG' => 'Serine',
    'UAU' => 'Tyrosine', 'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine', 'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP', 'UAG' => 'STOP', 'UGA' => 'STOP'
  }.freeze
  def self.of_codon(codon)
    CODONS.fetch(codon) { fail InvalidCodonError }
  end

  def self.of_rna(strand)
    raise InvalidCodonError if strand =~ /[^AUGC]/

    codons = []
    (0...strand.length).step(3) do |idx|
      codons << strand[idx..idx + 2]
      if %w[UAA UAG UGA].include?(codons.last)
        codons.pop
        break
      end
    end
    codons.map { |codon| of_codon(codon) }
  end
end

p Translation.of_rna('UAA')
