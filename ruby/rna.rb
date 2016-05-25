require_relative './rna_protein_codons'

class RNA
  attr_accessor :str

  def initialize
    self.str = ""
  end

  def self.from_file path
    rna = RNA.new
    rna.str = File.read path
    rna
  end

  def self.from_str str
    rna = RNA.new
    rna.str = str
    rna
  end

  def [] index
    self.str[index]
  end

  def to_dna
    str.gsub 'U', 'T'
  end

  def to_proteins
    proteins = ""
    self.str.scan(/\w\w\w/) do |triple|
      prot = RNA_CODONS[triple.to_sym]
      case prot
      when :STOP
        return proteins
      else
        proteins << prot.to_s
      end
    end
    proteins
  end
end
