require_relative './rna_protein_codons'
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
