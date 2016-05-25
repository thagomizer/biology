require_relative './protein_codons'
require 'pp'

class Protein
  attr_accessor :str

  def initialize
    self.str = ""
  end

  def self.from_file path
    protein = Protein.new
    protein.str = File.read(path).strip
    protein
  end

  def self.from_str str
    protein = Protein.new
    protein.str = str
    protein
  end

  def self.all_from_dna dna
    proteins = []

    while dna.length > 3 do
      p = encode_protein_dna(dna[0..-1])
      proteins << p if p
      dna = dna[1..-1]
    end

    proteins
  end

  def self.encode_protein_dna dna
    start = "ATG"

    return unless dna[0..2] == start

    protein = Protein.new
    i = 0
    while i < dna.length do
      amino_acid = DNA_CODONS[dna[i..i+2].to_sym]
      return protein if amino_acid == :STOP
      protein.str << amino_acid.to_s
      i += 3
    end

    nil
  end

  def [] index
    self.str[index]
  end

  def possible_rna_count
    rna_count = PROTEIN_RNA[:STOP].count # Accounts for the stop on the end
    self.str.each_char do |pro|
      rna_count *= PROTEIN_RNA[pro.to_sym].count
    end
    rna_count
  end
end
