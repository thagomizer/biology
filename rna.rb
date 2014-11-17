RNA_CODONS = {
 :UUU => :F,    :CUU => :L, :AUU => :I, :GUU => :V,
 :UUC => :F,    :CUC => :L, :AUC => :I, :GUC => :V,
 :UUA => :L,    :CUA => :L, :AUA => :I, :GUA => :V,
 :UUG => :L,    :CUG => :L, :AUG => :M, :GUG => :V,
 :UCU => :S,    :CCU => :P, :ACU => :T, :GCU => :A,
 :UCC => :S,    :CCC => :P, :ACC => :T, :GCC => :A,
 :UCA => :S,    :CCA => :P, :ACA => :T, :GCA => :A,
 :UCG => :S,    :CCG => :P, :ACG => :T, :GCG => :A,
 :UAU => :Y,    :CAU => :H, :AAU => :N, :GAU => :D,
 :UAC => :Y,    :CAC => :H, :AAC => :N, :GAC => :D,
 :UAA => :STOP, :CAA => :Q, :AAA => :K, :GAA => :E,
 :UAG => :STOP, :CAG => :Q, :AAG => :K, :GAG => :E,
 :UGU => :C,    :CGU => :R, :AGU => :S, :GGU => :G,
 :UGC => :C,    :CGC => :R, :AGC => :S, :GGC => :G,
 :UGA => :STOP, :CGA => :R, :AGA => :R, :GGA => :G,
 :UGG => :W,    :CGG => :R, :AGG => :R, :GGG => :G,
}

class RNA
  attr_accessor :str

  def initialize
    self.str = ""
  end

  def self.from_file path
    dna = RNA.new
    dna.str = File.read path
    dna
  end

  def self.from_str str
    dna = RNA.new
    dna.str = str
    dna
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
