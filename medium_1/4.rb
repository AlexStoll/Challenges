# Translate RNA sequences into proteins
# Each piece is called a codon, and corresponds to a protein


AMINO_TO_CODON = {
  'Methionine'    => ['AUG'],
  'Phenylalanine' => ['UUU', 'UUC'],
  'Leucine'       => ['UUA', 'UUG'],
  'Serine'        => ['UCU', 'UCC', 'UCA', 'UCG'],
  'Tyrosine'      => ['UAU', 'UAC'],
  'Cysteine'      => ['UGU', 'UGC'],
  'Tryptophan'    => ['UGG'],
  'STOP'          => ['UAA', 'UAG', 'UGA'],
  }

# "AUGUUUUCUUAAAUG"
# Codons : "AUG", "UUU", "UCU", "UAA", "AUG"
# Proteins : ...... "STOP" last one not included
class InvalidCodonError < StandardError; end

class Translation
  def self.of_codon(string)
    AMINO_TO_CODON.each do |protein, codons|
      return protein if codons.include?(string)
    end
    
  raise InvalidCodonError
  end

  def self.of_rna(strand)
    output = []
    strand.chars.each_slice(3) do |chunk|
      item = self.of_codon(chunk.join)
      break if item == 'STOP'
      output << item
    end
    output
  end
end