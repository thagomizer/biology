require_relative 'nucleic_acid'

class DNA
  attr_accessor :str

  def initialize
    self.str = ""
  end

  def self.from_file path
    dna = DNA.new
    dna.str = File.read path
    dna
  end

  def self.from_str str
    dna = DNA.new
    dna.str = str
    dna
  end

  def [] index
    self.str[index]
  end

  def to_rna
    str.gsub 'T', 'U'
  end

  def base_pair_hist
    bases = Hash.new 0
    str.split(//).each do |base|
      bases[base] += 1
    end

    bases
  end

  def cg_content
    bases = base_pair_hist
    ((bases['C'] + bases['G']) / str.length.to_f) * 100
  end

  def reverse_complement
    str.split(//).reverse.map { |na| NucleicAcid.complement(na) }.join
  end

  def hamming_distance other_dna
    distance = 0
    self.str.split(//).each_with_index do |b, index|
      distance += 1 if b != other_dna[index]
    end

    distance
  end
end
